import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:schedule_app/features/events/controllers/create_event_store.dart';
import 'package:schedule_app/features/events/controllers/events_store.dart';
import 'package:schedule_app/shared/routes/app_routes.dart';
import 'package:schedule_app/shared/theme/app_theme.dart';

class ScheduleApp extends StatelessWidget {
  const ScheduleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<EventsStore>(create: (_) => EventsStore()),
        Provider<CreateEventStore>(create: (_) => CreateEventStore()),
      ],
      child: MaterialApp(
        title: 'Schedule App',
        theme: AppTheme.materialTheme(context),
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.routes(context),
        initialRoute: '/splash',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('pt', 'BR')],
      ),
    );
  }
}
