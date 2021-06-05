import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tms/providers/service_providers.dart';

class PlanListError extends StatelessWidget {
  final String message;

  const PlanListError({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message, style: const TextStyle(fontSize: 20.0)),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () => context
                .read(planListServiceProvider.notifier)
                .retrievePlans(isRefreshing: true),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}