import { Router } from "express";
import { AuthenticationController } from "../controllers/authentication.controller";

const authrouter = Router();

authrouter.post("/signup", AuthenticationController.createNewAccount);
authrouter.post("/login", AuthenticationController.login);

export {authrouter}