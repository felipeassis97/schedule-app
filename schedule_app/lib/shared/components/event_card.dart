import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schedule_app/shared/components/custom_texts.dart';
import 'package:schedule_app/features/list_events/model/event_model.dart';
import 'package:schedule_app/shared/theme/app_colors.dart';
import 'package:schedule_app/shared/utils/app_formaters.dart';
import 'package:schedule_app/shared/utils/app_images.dart';

class EventCard extends StatelessWidget {
  final EventModel event;
  final int maxLinesDescription;
  const EventCard({Key? key, required this.event, this.maxLinesDescription = 3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _illustrationEvent(context),
          _title(),
          _eventDescription(),
          _dateAndHour(),
          _addressEvent(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _addressEvent() => Row(
        children: [
          const Icon(
            Icons.location_on_rounded,
            color: AppColors.neutralColorLowMedium,
            size: 20,
          ),
          Container(
            constraints: const BoxConstraints(minWidth: 250, maxWidth: 270),
            child: CustomTexts.smallText(formatedAddress(event.address),
                color: AppColors.neutralColorLowMedium, maxLines: 4),
          ),
        ],
      );

  Widget _dateAndHour() => Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
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
                  CustomTexts.smallText(
                      '${formatDay(DateTime.parse(event.startTime))} - ${formatDayMonthYear(DateTime.parse(event.endTime))}',
                      color: AppColors.yellow),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTexts.mediumText('Hora'),
                    const SizedBox(height: 4),
                    CustomTexts.smallText(
                        '${formatHour(DateTime.parse(event.startTime))} - ${formatHour(DateTime.parse(event.endTime))}',
                        color: AppColors.yellow),
                  ],
                ),
              )
            ],
          ),
        ),
      );

  Widget _eventDescription() => Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          constraints: const BoxConstraints(maxWidth: 350, minWidth: 280),
          child: CustomTexts.smallText(event.eventDescription,
              maxLines: maxLinesDescription),
        ),
      );

  Widget _title() => Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 8),
          child: CustomTexts.bigText(event.eventName),
        ),
      );

  Widget _illustrationEvent(context) => event.thumbnail != ''
      ? Container(
          constraints: const BoxConstraints(
              maxWidth: 300, minHeight: 150, minWidth: 280),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(
                  image: NetworkImage(event.thumbnail), fit: BoxFit.cover)),
        )
      : Container(
          constraints: const BoxConstraints(
              maxWidth: 300, minHeight: 100, minWidth: 280),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColors.blue,
          ),
          child: SvgPicture.asset(
            AppImages.defaultBanner,
            alignment: Alignment.center,
          ),
        );
}
