import 'package:dio/dio.dart' as dio;

class ScheduleApiResponse {
  final int? statusCode;
  final dynamic data;

  const ScheduleApiResponse({required this.statusCode, required this.data});

  factory ScheduleApiResponse.fromDioResponse(dio.Response response) {
    return ScheduleApiResponse(
        data: response.data, statusCode: response.statusCode);
  }
}
