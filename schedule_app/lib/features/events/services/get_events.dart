import 'dart:developer';

import 'package:schedule_app/features/events/models/event_model.dart';
import 'package:schedule_app/shared/client/schedule_client_impl.dart';

class GetEventsService {
  final client = ScheduleClientImpl();

  Future<List<EventModel>> getEventsList() async {
    final response = await client
        .get('https://628e3133368687f3e7121f1a.mockapi.io/api/v1/events');
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
