import { error } from "console";
import { Request,Response } from "express";
import jwt from "jsonwebtoken";
import * as EmailValidator from "email-validator";
import dotenv from "dotenv"
import bcrypt from "bcrypt"
import { getCustomRepository } from "typeorm";
import { UserRepository } from "../database/repository/user.repository";

/*
 * Status Codes:
 * 201 : Successful Response
 * 402 : Invalid Email
 * 401 : General Server Error
 * 403 : Used don't exist
 * 404 : Used already exist
 * 407 : Invalid Password
 */

dotenv.config();
export class AuthenticationController {
    static async showPosts(req: Request, res: Response){
        let jwt_secret_key = process.env.JWT_SECRET_KEY as string;
        let token = req.headers.authorization as string;
        jwt.verify(token, jwt_secret_key, async (error: any, data: any) => {
            if (error) {
                return res.send({
                    data: error,
                    received: false,
                });
            }
            return res.send({
                posts: "List of posts",
                userdata: data,
            });
        });
    }

    static validateEmail(useremail: string): boolean {
        let isEmailValidated = EmailValidator.validate(useremail);
        return isEmailValidated;
    }

    static async createNewAccount(req: Request, res: Response){
        let { useremail, userpassword } = req.body;
        let jwt_secret_key = process.env.JWT_SECRET_KEY as string;

        if (!AuthenticationController.validateEmail(useremail)) {
            return res.send({
                code: 402,
                authentication: false,
                message: "Enter valid email !",
            });
        }

        let salt = await bcrypt.genSalt(10);
        bcrypt.hash(userpassword, salt, async (error: any, hasedPassword: any) => {
            if (error) {
                return res.send({
                    code: 401,
                    authentication: false,
                    message: error,
                });
            }
            let userRepository = getCustomRepository(UserRepository);
            let checkIfUserExists = await userRepository.createQueryBuilder("users")
      .select()
      .where("users.useremail = :useremail", {
        useremail,
      })
      .getCount();

    if (checkIfUserExists > 0) {
      return res.send({
        code : 404,
        authentication: false,
        message: "User already exists!",
      });
    }
            await userRepository.saveUserData(req, res, hasedPassword);
            jwt.sign(
                {
                    useremail, //!payload
                },
                jwt_secret_key, //!secretKey
                {
                    expiresIn: "1h", //expiryTime
                },
                async (error: any, data: any) => {
                    //!callback
                    if (error) {
                        return res.send({
                            code : 401,
                            authentication: false,
                            message: error,
                        });
                    }
                    return res.send({
                        code: 201,
                        authentication: true,
                        message: data,
                    });
                }
            );
            
        });
    }

    static async login(req: Request, res: Response) {
        let { useremail, userpassword } = req.body;
        let jwt_secret_key = process.env.JWT_SECRET_KEY as string;
        if (!AuthenticationController.validateEmail(useremail)) {
            return res.send({
                code: 402,
                authentication: false,
                message: "Enter valid email !",
            });
        }
        let userRepository = getCustomRepository(UserRepository);
        let userdata = await userRepository.findUserPassword(req, res, useremail);
        let basePassword = userdata!.userpassword!;

        bcrypt.compare(userpassword, basePassword, async (error: any, result: any) => {
            if (error) {
                return res.send({
                    code: 401,
                    authentication: false,
                    message: error,
                });
            }
            if (!result) {
                return res.send({
                    code: 407,
                    authentication: false,
                    message: "Wrong Password",
                });
            }
            jwt.sign(
                {
                    useremail, //!payload
                },
                jwt_secret_key, //!secretKey
                {
                    expiresIn: "1h", //expiryTime
                },
                async (error: any, data: any) => {
                    //!callback
                    if (error) {
                        return res.send({
                            code: 401,
                            message: error,
                            authentication: false,
                        });
                    }
                    return res.send({
                        code: 201,
                        message: data,
                        authentication: true,
                    });
                }
            );

        })
    }
}