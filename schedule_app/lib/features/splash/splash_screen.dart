import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schedule_app/shared/theme/app_colors.dart';
import 'package:schedule_app/shared/utils/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  Future<void> _loadSettings(context) async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.popAndPushNamed(context, '/events');
    });
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    _loadSettings(context);
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.deepPurple,
      child: SvgPicture.asset(
        AppImages.appLogo,
      ),
    ));
  }
}
