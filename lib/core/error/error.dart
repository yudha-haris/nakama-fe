class Error implements Exception {
  final int? statusCode;
  final String? message;
  Error({this.statusCode, this.message});
}