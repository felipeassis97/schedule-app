import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schedule_app/shared/utils/app_images.dart';

class ErrorState extends StatelessWidget {
  const ErrorState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SvgPicture.asset(
            AppImages.errorState,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.28,
            height: MediaQuery.of(context).size.height * 0.28,
          ),
        ),
        Text(
          'Ocorreu um erro ao carregar os eventos',
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }
}
