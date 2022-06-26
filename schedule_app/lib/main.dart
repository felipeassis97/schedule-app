import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:schedule_app/features/events/controllers/events_store.dart';
import 'package:schedule_app/schedule_app.dart';

void main() {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Intl.defaultLocale = 'pt_BR';
  runApp(MultiProvider(
    providers: [
      Provider<EventsStore>(create: (_) => EventsStore()),
    ],
    child: const MyApp(),
  ));
}
