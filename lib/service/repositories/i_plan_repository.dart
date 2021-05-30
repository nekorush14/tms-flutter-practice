import 'package:tms/models/plan/plan_model.dart';

abstract class IPlanRepository {
  /// Read plan data from database by [userId].
  Future<List<Plan>?> retrievePlans({required String userId});

  /// Create [plan] data to database by [userId]
  Future<String> insertPlan({required String userId, required Plan plan});

  /// Update [plan] data of database which has created by [userId]
  Future<void> updatePlan({required String userId, required Plan plan});

  /// Delete [plan] data on database which has created by [userId]
  Future<void> deletePlan({required String userId, required String planId});
}