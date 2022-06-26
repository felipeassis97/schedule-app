import 'package:flutter/material.dart';
import 'package:schedule_app/shared/components/error_state.dart';
import 'package:schedule_app/shared/components/event_card.dart';
import 'package:schedule_app/shared/components/primary_button.dart';
import 'package:schedule_app/shared/theme/app_colors.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Eventos'),
            ),
            body: Column(
              children: [
                _tabBar(),
                _tabView(),
              ],
            ),
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

  Widget _tabView() => const Expanded(
        child: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [EventCard(), ErrorState()],
        ),
      );

  Widget _primaryButton(context) => Positioned(
        bottom: 24,
        left: 16,
        right: 16,
        child: PrimaryButton(
          onPressed: () {
            Navigator.pushNamed(context, '/event_details');
          },
          label: 'Criar novo evento',
        ),
      );
}
