import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:schedule_app/features/events/controllers/create_event_store.dart';
import 'package:schedule_app/features/events/controllers/events_store.dart';
import 'package:schedule_app/features/events/view/screens/my_events.dart';
import 'package:schedule_app/features/events/view/screens/soft_events.dart';
import 'package:schedule_app/shared/components/primary_button.dart';
import 'package:schedule_app/shared/theme/app_colors.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);
  static const routeName = '/events';

  @override
  Widget build(BuildContext context) {
    final eventsStore =
        ModalRoute.of(context)!.settings.arguments as EventsStore;
    initialLoad(eventsStore);

    return Stack(
      children: [
        DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Eventos'),
            ),
            body: Observer(builder: (context) {
              return LoadingOverlay(
                isLoading: eventsStore.isLoading,
                child: Column(
                  children: [
                    _tabBar(),
                    _tabView(eventsStore),
                  ],
                ),
              );
            }),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 56,
            width: double.infinity,
            color: Colors.white,
          ),
        ),
        _primaryButton(context),
      ],
    );
  }

  Widget _tabBar() => const TabBar(
        padding: EdgeInsets.only(top: 16.0, bottom: 8),
        indicatorPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        indicatorColor: AppColors.deepPurple,
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: AppColors.neutralColorLowLight,
        labelColor: AppColors.neutralColorLowPure,
        labelStyle:
            TextStyle(fontSize: 16, color: AppColors.neutralColorLowPure),
        tabs: [Tab(text: 'Eventos Soft'), Tab(text: 'Meus eventos')],
      );

  Widget _tabView(EventsStore eventStore) => Expanded(
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SoftEvents(eventsStore: eventStore),
            MyEvents(eventsStore: eventStore)
          ],
        ),
      );

  Widget _primaryButton(
    context,
  ) =>
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: PrimaryButton(
            onPressed: () async => Navigator.pushNamed(context, '/newEvent',
                arguments:
                    Provider.of<CreateEventStore>(context, listen: false)),
            label: 'Criar novo evento',
          ),
        ),
      );

  Future<void> initialLoad(EventsStore eventStore) async {
    await eventStore.getEvents();
  }
}
