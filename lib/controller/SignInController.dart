import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class SignInController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        Get.snackbar(
          "Sign In Cancelled",
          "You canceled the Google sign-in.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user != null) {
        Get.snackbar(
          "Login Successful",
          "Welcome ${user.displayName ?? 'User'}!",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offNamed('/home'); // Navigate to HomePage
      }

      return user;
    } catch (e) {
      Get.snackbar(
        "Login Failed",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print("Login error: $e");
      return null;
    }
  }

  Future<User?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final OAuthCredential credential = FacebookAuthProvider.credential(accessToken.tokenString);

        UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);
        User? user = userCredential.user;

        if (user != null) {
          Get.snackbar(
            "Login Successful",
            "Welcome ${user.displayName ?? 'User'}!",
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          Get.offNamed('/home'); // Navigate to HomePage
        }

        return user;
      } else {
        Get.snackbar(
          "Facebook Sign In Failed",
          result.message ?? "An error occurred.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return null;
      }
    } catch (e) {
      Get.snackbar(
        "Facebook Sign In Error",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print("Facebook login error: $e");
      return null;
    }
  }

  Future<void> handleSignup(SignupData signupData) async {
    try {
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: signupData.name!,
        password: signupData.password!,
      );

      User? user = userCredential.user;

      if (user != null) {
        Get.snackbar(
          "Sign Up Successful",
          "Welcome ${user.email}!",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offNamed('/home'); // Navigate to HomePage
      }
    } catch (e) {
      Get.snackbar(
        "Sign Up Failed",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print("Sign up error: $e");
    }
  }

  Future<void> handleLogin(LoginData loginData) async {
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: loginData.name!,
        password: loginData.password!,
      );

      User? user = userCredential.user;

      if (user != null) {
        Get.snackbar(
          "Login Successful",
          "Welcome back, ${user.email}!",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offNamed('/home'); // Navigate to HomePage
      }
    } catch (e) {
      Get.snackbar(
        "Login Failed",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print("Login error: $e");
    }
  }

  Future<void> handlePasswordRecovery(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      Get.snackbar(
        "Password Recovery",
        "Password reset email sent to $email",
        backgroundColor: Colors.blue,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        "Password Recovery Failed",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print("Password recovery error: $e");
    }
  }

  Future<User?> signInAnonymously() async {
    try {
      UserCredential userCredential = await firebaseAuth.signInAnonymously();
      User? user = userCredential.user;

      if (user != null) {
        Get.snackbar(
          "Anonymous Login Successful",
          "Welcome, Anonymous User!",
          backgroundColor: Colors.blue,
          colorText: Colors.white,
        );
        Get.offNamed('/home'); // Navigate to HomePage
      }

      return user;
    } catch (e) {
      Get.snackbar(
        "Anonymous Login Failed",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print("Anonymous login error: $e");
      return null;
    }
  }
}
