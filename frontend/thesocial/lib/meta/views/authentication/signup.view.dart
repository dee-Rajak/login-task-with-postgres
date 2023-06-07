import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:thesocial/app/routes/app.routes.dart';
import 'package:thesocial/core/notifier/authentication.notifier.dart';
import 'package:thesocial/core/notifier/utility.notifier.dart';
import 'package:thesocial/meta/utils/button.dart';
import 'package:thesocial/meta/utils/text_field.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    var authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    var utilityNotifier = Provider.of<UtilityNorifier>(context, listen: false);
    var _userimage =
        Provider.of<UtilityNorifier>(context, listen: true).userimage;

    return Scaffold(
      backgroundColor: Color(0xFF57ab49),
      appBar: AppBar(
        backgroundColor: Color(0xFF57ab49),
        elevation: 0,
        leading: Container(
          padding: EdgeInsets.all(10),
          height: 80,
          width: 80,
          child: Image.asset('assets/images/logo.png'),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          "CROPIO",
          style: GoogleFonts.lexendDeca(
            fontSize: 15,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10).copyWith(top: 20),
                child: Text(
                  "Register First",
                  style: GoogleFonts.montez(
                    color: Colors.white,
                    fontSize: size.aspectRatio * 70,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _userimage!.isNotEmpty
                        ? Container(
                            height: size.width * 0.25,
                            width: size.width * 0.25,
                            child: Image.network(utilityNotifier.userimage!),
                          )
                        : Container(
                            height: size.width * 0.25,
                            width: size.width * 0.25,
                            child: Image.asset('assets/images/camera.png'),
                          ),
                    SizedBox(
                      height: size.height * 0.001,
                    ),
                    CustomButton(
                      text: utilityNotifier.userimage!.isEmpty
                          ? "Upload Image"
                          : "Reselect",
                      fontsize: 25,
                      len: 0.35,
                      onPressed: () {
                        utilityNotifier.uploadUserImage(context: context);
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    CustomTextField(
                      hintText: "Enter Full Name",
                      controller: nameController,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    CustomTextField(
                      hintText: "Enter Email id",
                      controller: emailController,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    CustomTextField(
                      hintText: "Enter Password",
                      controller: passwordController,
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    CustomButton(
                      text: "Register",
                      len: 0.8,
                      onPressed: () {
                        authenticationNotifier.signup(
                            userimage: utilityNotifier.userimage!,
                            context: context,
                            username: nameController.text,
                            useremail: emailController.text,
                            userpassword: passwordController.text);
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: GoogleFonts.poppins(),
                        children: [
                          TextSpan(
                            text: 'Login',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushNamed(LoginRoute);
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
