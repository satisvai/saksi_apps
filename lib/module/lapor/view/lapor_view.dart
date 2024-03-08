import 'package:flutter/material.dart';
import 'package:saksi_apps/core.dart';
import 'package:saksi_apps/shared/image_picker/camera_picker.dart';
import '../controller/lapor_controller.dart';

class LaporView extends StatefulWidget {
  const LaporView({Key? key}) : super(key: key);

  Widget build(context, LaporController controller) {
    final String name = controller.auth.getEmailUser().toString();

    controller.view = this;
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Andrew Garfield"),
              accountEmail: Text(name),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1600486913747-55e5470d6f40?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
              ),
              decoration: BoxDecoration(
                color: Colors.blueGrey[900],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.code),
              title: const Text("About"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.rule),
              title: const Text("TOS"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text("Privacy Policy"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
              ),
              title: const Text("Logout"),
              onTap: () {
                controller.doSignOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              },
            )
          ],
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Column(
                      children: [
                        Text(
                          "LAPOR",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 16.0 * 2),
                        Row(
                          children: [
                            Spacer(),
                            Spacer(),
                          ],
                        ),
                        SizedBox(height: 16.0 * 2),
                      ],
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Expanded(
                          flex: 8,
                          child: Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: controller.suaraPaslonSatu,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  cursorColor: const Color(0xFF6F35A5),
                                  onSaved: (value) {},
                                  decoration: const InputDecoration(
                                    hintText: "Suara Paslon 1",
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Icon(Icons.person),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  controller: controller.suaraPaslonDua,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  cursorColor: const Color(0xFF6F35A5),
                                  onSaved: (value) {},
                                  decoration: const InputDecoration(
                                    hintText: "Suara Paslon 2",
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Icon(Icons.person),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  controller: controller.suaraPaslonTiga,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  cursorColor: const Color(0xFF6F35A5),
                                  onSaved: (value) {},
                                  decoration: const InputDecoration(
                                    hintText: "Suara Paslon 3",
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Icon(Icons.person),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                QCameraPicker(
                                    label: "Pilih Gambar C-1 Hasil",
                                    onChanged: (String imagePath) {
                                      controller.imagePath = imagePath;
                                      print(imagePath);
                                    }),
                                const SizedBox(height: 16.0),
                                Hero(
                                  tag: "lapor_btn",
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      await controller.submitLaporan();
                                    },
                                    child: Text(
                                      "Kirim".toUpperCase(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<LaporView> createState() => LaporController();
}
