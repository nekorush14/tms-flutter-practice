import 'package:hooks_riverpod/hooks_riverpod.dart';

class BusinessExceptionStateNotifier extends StateNotifier<BusinessException> {
  BusinessExceptionStateNotifier([BusinessException? businessException])
      : super(businessException ?? BusinessException(title: "", content: ""));
}

class BusinessException {
  String title;
  String content;

  BusinessException({required this.title, required this.content});

  void create(String? title, String? content) {
    this.title = title ?? "";
    this.content = content ?? "";
  }

  void reset() {
    this.title = "";
    this.content = "";
  }
}
