import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:saksi_apps/core.dart';
import 'package:saksi_apps/firebase_options.dart';
import 'package:saksi_apps/module/login/auth/auth.dart';
import 'package:saksi_apps/state_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const SaksiApp());
}

class SaksiApp extends StatelessWidget {
  const SaksiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.navigatorKey,
      home: const AuthPage(),
    );
  }
}
