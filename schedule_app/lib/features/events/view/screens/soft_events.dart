import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:schedule_app/features/events/controllers/events_store.dart';
import 'package:schedule_app/features/events/view/widgets/resumed_event_card.dart';
import 'package:schedule_app/shared/components/empty_state.dart';
import 'package:schedule_app/shared/components/error_state.dart';

class SoftEvents extends StatefulWidget {
  final EventsStore eventsStore;
  const SoftEvents({Key? key, required this.eventsStore}) : super(key: key);

  @override
  State<SoftEvents> createState() => _SoftEventsState();
}

class _SoftEventsState extends State<SoftEvents> {
  @override
  Widget build(BuildContext context) {
    final eventsStore = widget.eventsStore;

    return Observer(builder: (context) {
      return eventsStore.eventList.isEmpty
          ? const EmptyState()
          : eventsStore.isError
              ? const ErrorState()
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: eventsStore.eventList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, '/eventDetails',
                                arguments: eventsStore.eventList[index]),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: ResumedEventCard(
                                  event: eventsStore.eventList[index]),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 48),
                  ],
                );
    });
  }
}
