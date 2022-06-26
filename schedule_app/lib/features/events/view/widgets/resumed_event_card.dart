import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schedule_app/shared/components/custom_texts.dart';
import 'package:schedule_app/shared/components/event_card.dart';
import 'package:schedule_app/shared/theme/app_colors.dart';
import 'package:schedule_app/shared/utils/app_images.dart';

class ResumedEventCard extends StatelessWidget {
  const ResumedEventCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _dateInfo(),
        _divider(),
        const EventCard()
        // _eventInfo(context),
      ],
    );
  }

  Widget _eventInfo(context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _illustrationEvent(context),
          _title(),
          _eventDescription(),
          _dateAndHour(),
          _addressEvent()
        ],
      );

  Widget _addressEvent() => Row(
        children: [
          const Icon(
            Icons.location_on_rounded,
            color: AppColors.neutralColorLowMedium,
            size: 20,
          ),
          CustomTexts.smallText('Rua Manoel Pedro Bernardo, 115,\nCriuma-SC',
              color: AppColors.neutralColorLowMedium, maxLines: 3),
        ],
      );

  Widget _dateAndHour() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Container(
          constraints:
              const BoxConstraints(minWidth: 250, maxWidth: double.infinity),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTexts.mediumText('Data'),
                  const SizedBox(height: 4),
                  CustomTexts.smallText('SEX - 06/06/22',
                      color: AppColors.yellow),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTexts.mediumText('Hora'),
                  const SizedBox(height: 4),
                  CustomTexts.smallText('17:00 - 20:00',
                      color: AppColors.yellow),
                ],
              )
            ],
          ),
        ),
      );

  Widget _eventDescription() => Container(
        constraints: const BoxConstraints(maxWidth: 280),
        child: CustomTexts.smallText(
            'Vamos celebrar? Sim! Teve reforma da sede, gravação de vídeo, registro fotográfico e uma nova marca está por vir… Isso tudo merece um brinde do nosso jeito: o primeiro Happy Soft Hour de 2022!',
            maxLines: 5),
      );

  Widget _title() => Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 8),
        child: CustomTexts.bigText('SoftTalk + Happy Soft Hour'),
      );

  Widget _divider() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: VerticalDivider(
          color: AppColors.neutralColorHightDark,
          thickness: 2, //thickness of divier line
        ),
      );

  Widget _dateInfo() => Padding(
        padding: const EdgeInsets.only(top: 16, left: 8),
        child: Column(
          children: const [
            Text("SEX",
                style: TextStyle(
                    fontSize: 14, color: AppColors.neutralColorLowMedium)),
            Text('03/06',
                style: TextStyle(
                    fontSize: 14, color: AppColors.neutralColorLowMedium))
          ],
        ),
      );

  Widget _illustrationEvent(context) => Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 300, minHeight: 100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.blue,
            ),
          ),
          SvgPicture.asset(
            AppImages.defaultBanner,
            alignment: Alignment.center,
          ),
        ],
      );
}
