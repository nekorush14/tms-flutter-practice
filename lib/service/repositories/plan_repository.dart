import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tms/models/plan/plan_model.dart';
import 'package:tms/providers/firebase_providers.dart';
import 'package:tms/service/repositories/i_plan_repository.dart';
import 'package:tms/utils/business_exception_handler.dart';
import 'package:tms/utils/extensions/firebase_firestore_extention.dart';

class PlanRepository implements IPlanRepository {
  final Reader _reader;

  const PlanRepository(this._reader);

  @override
  Future<List<Plan>?> retrievePlans({required String userId}) async {
    try {
      final snapshot =
          await _reader(firestoreProvider).planListRef(userId).get();
      return snapshot.docs.map((doc) => Plan.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw BusinessException(title: '', content: '${e.message ?? ''}');
    }
  }

  @override
  Future<String> insertPlan(
      {required String userId, required Plan plan}) async {
    try {
      // if (plan.createdAt == null) {
      //   plan.createdAt = DateTime.now();
      // }
      final ref = await _reader(firestoreProvider)
          .planListRef(userId)
          .add(plan.toDocument());
      return ref.id;
    } on FirebaseException catch (e) {
      throw BusinessException(title: 'title', content: '${e.message ?? ''}');
    }
  }

  @override
  Future<void> updatePlan({required String userId, required Plan plan}) async {
    try {
      final ref = await _reader(firestoreProvider)
          .planListRef(userId)
          .doc(plan.id)
          .update(plan.toDocument());
    } on FirebaseException catch (e) {
      throw BusinessException(title: 'title', content: '${e.message ?? ''}');
    }
  }

  @override
  Future<void> deletePlan(
      {required String userId, required String planId}) async {
    try {
      final ref = await _reader(firestoreProvider)
          .planListRef(userId)
          .doc(planId)
          .delete();
    } on FirebaseException catch (e) {
      throw BusinessException(title: 'title', content: '${e.message ?? ''}');
    }
  }
}
