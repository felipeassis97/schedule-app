import 'dart:developer';
import 'package:schedule_app/features/events/models/event_model.dart';
import 'package:schedule_app/shared/client/schedule_client_impl.dart';
import 'package:schedule_app/shared/utils/app_configs.dart';

class GetEventsService {
  final client = ScheduleClientImpl();

  Future<List<EventModel>> getEventsList() async {
    final response = await client.get('${AppConfigs.baseUrl}/events');
    if (response.statusCode == 200) {
      inspect(response);
      return List.from(response.data)
          .map((event) => EventModel.fromJson(event))
          .toList();
    } else {
      throw Exception();
    }
  }
}
