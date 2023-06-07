import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:thesocial/app/routes/app.routes.dart';
import 'package:thesocial/core/notifier/authentication.notifier.dart';
import 'package:thesocial/meta/utils/button.dart';
import 'package:thesocial/meta/utils/text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    var authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
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
                padding: EdgeInsets.all(10).copyWith(top: 30),
                child: Text(
                  "Welcome Back",
                  style: GoogleFonts.montez(
                    color: Colors.white,
                    fontSize: size.aspectRatio * 70,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.15,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                      height: size.height * 0.15,
                    ),
                    CustomButton(
                      text: "Login",
                      len: 0.8,
                      onPressed: () {
                        authenticationNotifier.login(
                            context: context,
                            email: emailController.text,
                            password: passwordController.text);
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: GoogleFonts.poppins(),
                        children: [
                          TextSpan(
                            text: 'Register',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushNamed(SignupRoute);
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
      /*
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Enter email",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(hintText: "Enter password"),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  authenticationNotifier.login(
                      context: context,
                      email: emailController.text,
                      password: passwordController.text);
                },
                child: Text("login"),
              ),
              SizedBox(
                height: 50,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SignupRoute);
                },
                child: Text("New ? SignUp"),
              )
            ],
          ),
        ),
      ),
      */
    );
  }
}
