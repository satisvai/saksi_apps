import 'package:flutter/material.dart';
import 'package:saksi_apps/core.dart';
import '../controller/absen_controller.dart';

class AbsenView extends StatefulWidget {
  const AbsenView({Key? key}) : super(key: key);

  Widget build(context, AbsenController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Absen"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<AbsenView> createState() => AbsenController();
}
