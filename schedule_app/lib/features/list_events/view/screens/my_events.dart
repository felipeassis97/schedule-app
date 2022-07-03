import 'package:flutter/material.dart';
import 'package:schedule_app/features/list_events/controllers/events_store.dart';
import 'package:schedule_app/shared/components/empty_state.dart';

class MyEvents extends StatefulWidget {
  final EventsStore eventsStore;

  const MyEvents({Key? key, required this.eventsStore}) : super(key: key);

  @override
  State<MyEvents> createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  @override
  Widget build(BuildContext context) {
    return const EmptyState();
  }
}
