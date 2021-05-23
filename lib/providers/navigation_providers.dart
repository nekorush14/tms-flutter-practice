import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tms/utils/tab_type_notifier.dart';

final tabTypeProvider =
    StateNotifierProvider<TabTypeNotifier, TabType>((ref) => TabTypeNotifier());
