import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tms/app/views/widgets/plan_list_error_widget.dart';
import 'package:tms/providers/application_providers.dart';
import 'package:tms/providers/service_providers.dart';
import 'package:tms/utils/business_exception_handler.dart';

class PlanListWidget extends HookWidget {
  const PlanListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _planListState = useProvider(planListServiceProvider);
    return _planListState.when(
      data: (plans) => plans.isEmpty
          ? const Center(
              child: Text(
                'No plan listed',
                style: TextStyle(fontSize: 20.0),
              ),
            )
          : ListView.builder(
              itemCount: plans.length,
              itemBuilder: (BuildContext context, int index) {
                final plan = plans[index];
                return ProviderScope(
                  overrides: [currentPlan.overrideWithValue(plan)],
                  child: ListTile(
                    key: ValueKey(plan.id),
                    title: Text(plan.title),
                    trailing: Text(plan.description),
                  ),
                );
              },
            ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, _) => PlanListError(
        message: error is BusinessException
            ? error.content
            : 'Something went wrong!',
      ),
    );
  }
}
