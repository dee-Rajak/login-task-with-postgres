import 'package:thesocial/meta/views/authentication/login.view.dart';
import 'package:thesocial/meta/views/authentication/signup.view.dart';
import 'package:thesocial/meta/views/decider_view/decider.view.dart';
import 'package:thesocial/meta/views/home_view/home.view.dart';

final String LoginRoute = "/login";
final String SignupRoute = "/signup";
final String DeciderRoute = "/decider";
final String HomeRoute = "/";

final routes = {
  LoginRoute: (context) => LoginView(),
  SignupRoute: (context) => SignupView(),
  DeciderRoute: (context) => DeciderView(),
  HomeRoute: (context) => HomeView(),
};
