import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tms/models/plan/plan_model.dart';
import 'package:tms/providers/auth_providers.dart';
import 'package:tms/service/controllers/plan_list_controller.dart';

final planListServiceProvider =
    StateNotifierProvider<PlanListController, AsyncValue<List<Plan>>>(
  (ref) {
    final user = ref.watch(authServicesProvider);
    return PlanListController(ref.read, user.fetchCurrentUser()!.uid);
  },
);
