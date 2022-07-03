import 'dart:convert';
import 'dart:developer';

import 'package:schedule_app/features/list_events/model/event_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveLocalEvent {
  Future<void> saveLocalEvent({required EventModel event}) async {
    try {
      final instance = await SharedPreferences.getInstance();
      List<String> listEvents = [];

      if (instance.containsKey('events')) {
        listEvents = instance.getStringList('events')!;
        listEvents.add(jsonEncode(event.toJson()));
        instance.setStringList('events', listEvents);
      } else {
        listEvents.add(jsonEncode(event.toJson()));
        instance.setStringList('events', listEvents);
      }

      log('Local:${instance.getStringList('events')}');
    } catch (_) {
      throw Exception();
    }
  }
}
