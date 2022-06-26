import 'package:flutter/material.dart';
import 'package:schedule_app/shared/routes/app_routes.dart';
import 'package:schedule_app/shared/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.materialTheme(context),
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes(context),
      initialRoute: '/splash',
    );
  }
}
