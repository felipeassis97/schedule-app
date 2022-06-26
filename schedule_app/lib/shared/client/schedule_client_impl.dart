import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:schedule_app/shared/client/schedule_api_response.dart';
import 'package:schedule_app/shared/client/schedule_client.dart';

class ScheduleClientImpl implements ScheduleClient {
  final dio.Dio client = Dio();

  @override
  Future<ScheduleApiResponse> get(String path,
      {Map<String, String>? headers, Map<String, dynamic>? query}) async {
    final response = await client.get(path,
        queryParameters: query,
        options: dio.Options(
            headers: headers,
            validateStatus: (status) =>
                status != null && (status >= 200 && status <= 499)));

    return ScheduleApiResponse.fromDioResponse(response);
  }
}
