import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl/intl.dart';
import 'package:schedule_app/schedule_app.dart';

void main() async {
  await startConfig();
  runApp(const ScheduleApp());
}

Future<void> startConfig() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Intl.defaultLocale = 'pt_BR';
  await dotenv.load(fileName: ".env");
}
