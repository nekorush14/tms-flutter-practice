import 'package:cloud_firestore/cloud_firestore.dart';

extension FireBaseFirestoreX on FirebaseFirestore {
  /// Fetch plans collection from firestore which has [userId].
  CollectionReference planListRef(String userId) =>
      collection('planList').doc(userId).collection('plans');
}