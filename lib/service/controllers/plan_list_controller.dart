import 'package:tms/models/plan/plan_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tms/providers/repository_providers.dart';
import 'package:tms/providers/util_providers.dart';
import 'package:tms/utils/business_exception_handler.dart';

class PlanListController extends StateNotifier<AsyncValue<List<Plan>>> {
  final Reader _reader;
  final String? _userId;

  PlanListController(this._reader, this._userId) : super(AsyncValue.loading());

  Future<void> retrievePlans({bool isRefreshing = false}) async {
    if (isRefreshing) {
      state = AsyncValue.loading();
    }
    try {
      final plans =
          await _reader(planRepositoryProvider).retrievePlans(userId: _userId!);
      if (mounted) {
        state = AsyncValue.data(plans!);
      }
    } on BusinessException catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addPlan(
      {String? title,
      String? category,
      String? description,
      required String userName,
      bool obtained = false}) async {
    try {
      final plan = Plan(
          isObtained: obtained,
          title: title ?? '',
          updateUser: userName,
          category: category ?? '',
          description: description ?? '',
          createUser: userName);
      final itemId = await _reader(planRepositoryProvider).insertPlan(
        userId: _userId!,
        plan: plan,
      );
      state.whenData((items) =>
          state = AsyncValue.data(items..add(plan.copyWith(id: itemId))));
    } on BusinessException catch (e) {
      _reader(businessExceptionProvider.notifier).state = e;
    }
  }

  Future<void> updateItem({required Plan updatedPlan}) async {
    try {
      await _reader(planRepositoryProvider)
          .updatePlan(userId: _userId!, plan: updatedPlan);
      state.whenData((plans) {
        state = AsyncValue.data([
          for (final plan in plans)
            if (plan.id == updatedPlan.id) updatedPlan else plan
        ]);
      });
    } on BusinessException catch (e) {
      _reader(businessExceptionProvider.notifier).state = e;
    }
  }

  Future<void> deleteItem({required String planId}) async {
    try {
      await _reader(planRepositoryProvider).deletePlan(
        userId: _userId!,
        planId: planId,
      );
      state.whenData((plans) => state =
          AsyncValue.data(plans..removeWhere((plan) => plan.id == planId)));
    } on BusinessException catch (e) {
      _reader(businessExceptionProvider.notifier).state = e;
    }
  }
}
