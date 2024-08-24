import 'package:dio/dio.dart';

abstract class Failure {}

class ServerFailure extends Failure {
  final String errMsg;

  ServerFailure(this.errMsg);
  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout with ApiServer");

      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timeout with ApiServer");

      case DioExceptionType.badCertificate:
        return ServerFailure("Bad Certificate ");

      case DioExceptionType.badResponse:
        return ServerFailure.frombadResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("Request to ApiServer was canceld");
      case DioExceptionType.connectionError:
        return ServerFailure("No Internet Connection");
      case DioExceptionType.unknown:
        return ServerFailure("Unexpected Error, Please try again");
      default:
        return ServerFailure("Opps there was an error, Please try again later");
    }
  }
  factory ServerFailure.frombadResponse(int status, dynamic response) {
    if (status == 400 || status == 401 || status == 403) {
      return ServerFailure(response["error"]["message"]);
    } else if (status == 404) {
      return ServerFailure("Your request not found, Please try later!");
    } else if (status == 500) {
      return ServerFailure("Internal server error, Please try later");
    } else {
      return ServerFailure("Opps there was an error, Please try again ");
    }
  }
}
