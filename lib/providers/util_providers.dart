import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:tms/utils/business_exception_handler.dart';

final loggerProvider = Provider((ref) => SimpleLogger());
final errorMsgProvider = StateProvider((ref) => "");
final businessExceptionProvider = ChangeNotifierProvider(
    (ref) => BusinessExceptionHandler());
