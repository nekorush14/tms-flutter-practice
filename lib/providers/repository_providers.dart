import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tms/service/repositories/plan_repository.dart';

final planRepositoryProvider =
    Provider<PlanRepository>((ref) => PlanRepository(ref.read));