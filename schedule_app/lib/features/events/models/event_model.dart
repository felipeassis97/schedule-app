// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:schedule_app/features/events/models/address_model.dart';

class EventModel {
  final int id;
  final String eventName;
  final String eventDescription;
  final String startTime;
  final String endTime;
  final String thumbnail;
  final String eventUrl;
  final AddressModel address;
  EventModel({
    required this.id,
    required this.eventName,
    required this.eventDescription,
    required this.startTime,
    required this.endTime,
    required this.thumbnail,
    required this.eventUrl,
    required this.address,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      eventName: json['event_name'],
      eventDescription: json['event_description'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      thumbnail: json['thumbnail'],
      eventUrl: json['eventURL'],
      address: AddressModel.fromJson(json['address']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> eventData = {};
    eventData['id'] = id;
    eventData['eventName'] = eventName;
    eventData['eventDescription'] = eventDescription;
    eventData['startTime'] = startTime;
    eventData['endTime'] = endTime;
    eventData['thumbnail'] = thumbnail;
    eventData['eventUrl'] = eventUrl;
    eventData['address'] = address.toJson();

    return eventData;
  }
}
