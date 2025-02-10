import '../../const/app_const.dart';

class AppException implements Exception {
  final String? message;
  final String? prefix;

  AppException([this.message, this.prefix]);

  @override
  String toString() => "${prefix ?? ""}${message ?? "An error occurred"}";
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, AppConst.preBadRequest);
}

class NoInternetException extends AppException {
  NoInternetException([String? message]) : super(message, AppConst.preNoInternetException);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message]) : super(message, AppConst.preUnauthorized);
}
