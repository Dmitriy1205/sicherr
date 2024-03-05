class BadRequestException implements Exception {
  final String message;
  final String? code;

  BadRequestException({
    required this.message,
    this.code,
  });
}