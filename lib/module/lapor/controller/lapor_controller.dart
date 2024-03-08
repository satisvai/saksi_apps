import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saksi_apps/core.dart';
import 'package:saksi_apps/models/lapor_model.dart';
import 'package:saksi_apps/models/user_model.dart';
import 'package:saksi_apps/services/firebase_auth_service.dart';
import '../view/lapor_view.dart';

class LaporController extends State<LaporView> {
  final FirebaseAuthService auth = FirebaseAuthService();
  late TextEditingController suaraPaslonSatu;
  late TextEditingController suaraPaslonDua;
  late TextEditingController suaraPaslonTiga;

  String? imagePath;

  static late LaporController instance;
  late LaporView view;

  @override
  void initState() {
    suaraPaslonSatu = TextEditingController();
    suaraPaslonDua = TextEditingController();
    suaraPaslonTiga = TextEditingController();

    instance = this;

    if (auth.getUser() == null) {
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginView()),
        );
      });
    } else {
      setState(() {});
    }

    super.initState();
  }

  @override
  void dispose() {
    suaraPaslonSatu.dispose();
    suaraPaslonDua.dispose();
    suaraPaslonTiga.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  void doSignOut() async {
    try {
      auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  Future<UserModel> getUserData() async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    var snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    return UserModel.fromMap(snapshot.data()!);
  }

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery); // or ImageSource.camera

    if (image != null) {
      setState(() {
        imagePath = image.path;
      });
    }
  }

  Future<LaporModel> createLaporModel() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User not logged in');
    }

    final userData = await FirestoreService().getUserData(userId);

    return LaporModel(
      kabKota: userData.kabKota!,
      kecamatan: userData.kecamatan!,
      kelurahanDesa: userData.kelurahanDesa!,
      noTps: userData.noTPS!,
      suaraPaslon1: int.tryParse(suaraPaslonSatu.text) ?? 0,
      suaraPaslon2: int.tryParse(suaraPaslonDua.text) ?? 0,
      suaraPaslon3: int.tryParse(suaraPaslonTiga.text) ?? 0,
      imageCHasil:
          imagePath, // Assuming imageUrl is set when the image is picked/uploaded
    );
  }

  Future<void> submitLaporan() async {
    try {
      final laporModel = await createLaporModel();
      await FirestoreService().postLaporData(laporModel);
      // Handle successful submission, maybe show a success message or navigate
    } catch (e) {
      // Handle errors, maybe show an error message
      print('Error submitting laporan: $e');
    }
  }
}
