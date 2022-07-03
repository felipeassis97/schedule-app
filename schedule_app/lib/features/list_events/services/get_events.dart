import 'dart:developer';
import 'package:provider/provider.dart';
import 'package:schedule_app/features/list_events/model/event_model.dart';
import 'package:schedule_app/shared/client/schedule_client_impl.dart';
import 'package:schedule_app/shared/utils/app_configs.dart';

class GetEventsService {
  Future<List<EventModel>> getEventsList(context) async {
    final client = Provider.of<ScheduleClientImpl>(context, listen: false);
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
