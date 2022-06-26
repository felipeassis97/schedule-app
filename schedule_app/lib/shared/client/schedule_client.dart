import 'package:schedule_app/shared/client/schedule_api_response.dart';

abstract class ScheduleClient {
  Future<ScheduleApiResponse> get(String path,
      {Map<String, String>? headers, Map<String, dynamic>? query});
}
