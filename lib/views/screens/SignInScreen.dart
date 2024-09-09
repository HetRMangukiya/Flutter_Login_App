import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:flutter_login_app/controller/SignInController.dart';
import '../utils/ImageUtils.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInController controller = Get.put(
      SignInController(),
    );

    return FlutterLogin(
      headerWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () async {
              await controller.signInAnonymously();
            },
            child: Center(
              child: Text(
                "Sign in Anonymously",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          InkWell(
            onTap: () async {
              await controller.signInWithGoogle();
            },
            child: Center(
              child: Text(
                "Google Sign in",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          InkWell(
            onTap: () async {
              await controller.signInWithFacebook();
            },
            child: Center(
              child: Text(
                "FaceBook Sign in",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
        ],
      ),
      onSignup: (val) async {
        await controller.handleSignup(val);
        return null;
      },
      logo: AssetImage(
        ImageUtils.ImagePath + ImageUtils.AppLogo,
      ),
      title: "Flutter Login With GetX",
      initialAuthMode: AuthMode.signup,
      userType: LoginUserType.email,
      onLogin: (LoginData val) async {
        await controller.handleLogin(val);
        return null;
      },
      onRecoverPassword: (val) async {
        await controller.handlePasswordRecovery(val);
        return null;
      },
      theme: LoginTheme(
        titleStyle: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
