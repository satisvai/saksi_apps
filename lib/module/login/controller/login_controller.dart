import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saksi_apps/core.dart';
import 'package:saksi_apps/module/login/auth/auth.dart';
import 'package:saksi_apps/services/firebase_auth_service.dart';
import '../view/login_view.dart';

class LoginController extends State<LoginView> {
  final FirebaseAuthService auth = FirebaseAuthService();

  late TextEditingController emailController;
  late TextEditingController passwordController;

  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    instance = this;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  void doLogin() async {
    String email = emailController.text;
    String password = passwordController.text;

    // User? user = await auth.signInWithEmailAndPassword(email, password);

    try {
      User? user = await auth.signInWithEmailAndPassword(email, password);
      if (user != null) {
        print("Login Sukses");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AuthPage()),
        );
        setState(() {});
      }
    } catch (e) {
      print("Login Gagal: $e");
      final snackBar = SnackBar(
        content: Text('Login Gagal: ${e.toString()}'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
