import 'package:flutter/material.dart';
import 'package:schedule_app/shared/components/event_card.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do evento'),
      ),
      body: const EventCard(),
    );
  }
}
