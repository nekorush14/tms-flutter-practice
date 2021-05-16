import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:tms/utils/business_exception_handler.dart';

final providerContainer = ProviderContainer();

final loggerProvider = Provider((ref) => SimpleLogger());
final errorMsgProvider = StateProvider((ref) => "");
final businessExceptionProvider =
    StateNotifierProvider<BusinessExceptionStateNotifier, BusinessException>(
        (ref) => BusinessExceptionStateNotifier());
