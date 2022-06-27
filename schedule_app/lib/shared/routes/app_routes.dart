import 'package:flutter/material.dart';
import 'package:schedule_app/features/events/view/screens/event_details.dart';
import 'package:schedule_app/features/events/view/screens/events_screen.dart';
import 'package:schedule_app/features/events/view/screens/new_event_screen.dart';
import 'package:schedule_app/features/splash/splash_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes(context) {
    return {
      '/splash': (context) => const SplashScreen(),
      EventsScreen.routeName: (context) => const EventsScreen(),
      EventDetails.routeName: (context) => const EventDetails(),
      CreateNewEvent.routeName: (context) => const CreateNewEvent(),
      '/event_location': (context) => const EventDetails(),
    };
  }
}
