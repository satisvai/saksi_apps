import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saksi_apps/core.dart';
import 'package:saksi_apps/models/user_model.dart';
import '../view/daftar_view.dart';

class DaftarController extends State<DaftarView> {
  static late DaftarController instance;
  late DaftarView view;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var noTelefonController = TextEditingController();
  var kabKotaController = TextEditingController();
  var kecamatanController = TextEditingController();
  var kelurahanDesaController = TextEditingController();
  var noTpsController = TextEditingController();
  
  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    noTelefonController.dispose();
    kabKotaController.dispose();
    kecamatanController.dispose();
    kelurahanDesaController.dispose();
    noTpsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  Future<void> registerUser(
    String nama,
    String noTelefon,
    String kabKota,
    String kecamatan,
    String kelurahanDesa,
    int noTPS) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: emailController.text, // Pastikan email disediakan
      password: passwordController.text, // Pastikan password disediakan
    );



    UserModel newUser = UserModel(
      nama: nama,
      noTelefon: noTelefon,
      kabKota: kabKota,
      kecamatan: kecamatan,
      kelurahanDesa: kelurahanDesa,
      noTPS: noTPS,
      absen: false,
    );

    await firestore
        .collection('users')
        .doc(userCredential.user!.uid)
        .set(newUser.toMap());
  } on FirebaseAuthException catch (e) {
    print(e.message);
  }
}

}
