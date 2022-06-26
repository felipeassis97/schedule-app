import 'package:flutter/material.dart';
import 'package:schedule_app/features/events/view/screens/event_details.dart';
import 'package:schedule_app/features/events/view/screens/events_screen.dart';
import 'package:schedule_app/features/splash/splash_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes(context) {
    return {
      '/splash': (context) => const SplashScreen(),
      '/events': (context) => const EventsScreen(),
      EventDetails.routeName: (context) => const EventDetails(),
      '/event_location': (context) => const EventDetails(),
    };
  }
}
