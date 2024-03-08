import 'package:flutter/material.dart';
import 'package:saksi_apps/core.dart';
import '../controller/daftar_controller.dart';

class DaftarView extends StatefulWidget {
  const DaftarView({Key? key}) : super(key: key);

  Widget build(context, DaftarController controller) {
    

    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar"),
        actions: const [],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                controller: controller.emailController,
                maxLength: 20,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  suffixIcon: Icon(
                    Icons.email,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: 'Enter your email address',
                ),
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: controller.passwordController,
                maxLength: 20,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  suffixIcon: Icon(
                    Icons.password,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: 'Enter your password',
                ),
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: controller.nameController,
                maxLength: 20,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: "What's your name?",
                ),
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: controller.noTelefonController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: 'Masukan no telfon valid',
                ),
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: controller.kabKotaController,
                maxLength: 20,
                decoration: const InputDecoration(
                  labelText: 'Kab/Kota',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: "Isi Kabupaten/Kota",
                ),
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: controller.kecamatanController,
                maxLength: 20,
                decoration: const InputDecoration(
                  labelText: 'Kecamatan',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: "Isi Kecamatan",
                ),
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: controller.kelurahanDesaController,
                maxLength: 20,
                decoration: const InputDecoration(
                  labelText: 'Kelurahan/Desa',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: "Isi Kelurahan/Desa",
                ),
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: controller.noTpsController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'No. TPS',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: 'Isi No TPS',
                ),
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                   int noTPSInt = int.tryParse(controller.noTpsController.text) ?? 0; // Convert to int, default to 0 if conversion fails

                    controller.registerUser(
                        controller.nameController.text,
                        controller.noTelefonController.text,
                        controller.kabKotaController.text,
                        controller.kecamatanController.text,
                        controller.kelurahanDesaController.text,
                        noTPSInt);
                  Navigator.pop(context);
                  },
                  child: const Text(
                    "Daftar",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<DaftarView> createState() => DaftarController();
}
