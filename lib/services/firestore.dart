import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:saksi_apps/models/lapor_model.dart';
import 'package:saksi_apps/models/user_model.dart';

class FirestoreService {

  // Get User Data
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getUserData(String userId) async {
    var snapshot = await _firestore.collection('users').doc(userId).get();
    return UserModel.fromMap(snapshot.data()!); // Assuming UserModel has a fromMap constructor
  }

    Future<void> postLaporData(LaporModel laporModel) async {
    await _firestore.collection('laporan').add(laporModel.toMap());
  }



}