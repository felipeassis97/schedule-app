import 'package:flutter/material.dart';
import 'package:schedule_app/features/events/models/event_model.dart';
import 'package:schedule_app/shared/components/event_card.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({Key? key}) : super(key: key);
  static const routeName = '/eventDetails';

  @override
  Widget build(BuildContext context) {
    final event = ModalRoute.of(context)!.settings.arguments as EventModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do evento'),
      ),
      body: EventCard(event: event),
    );
  }
}
