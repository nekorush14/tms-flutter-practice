class BusinessException implements Exception {
  final String? message;

  const BusinessException({this.message = ""});

  @override
  String toString() {
    return '[BusinessException]: $message';
  }
}
