import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/assets.dart';
import '../../../../utils/theme.dart';

class DateTimeView extends StatefulWidget {
  static String routeName = '/date-view';
  const DateTimeView({super.key});

  @override
  State<DateTimeView> createState() => _DateTimeViewState();
}

class _DateTimeViewState extends State<DateTimeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Appointment"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: AppTheme.accentColor,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: AppTheme.pagePadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Select Date",
                      style: AppTheme.primaryHeadingTextSmall.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    CalendarDatePicker(
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                      onDateChanged: (date) {},
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Select Time",
                      style: AppTheme.primaryHeadingTextSmall.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        runAlignment: WrapAlignment.spaceBetween,
                        runSpacing: 13,
                        spacing: 33,
                        children: [
                          TimeSlotChip(),
                          TimeSlotChip(),
                          TimeSlotChip(),
                          TimeSlotChip(),
                          TimeSlotChip(),
                          TimeSlotChip(),
                          TimeSlotChip(),
                          TimeSlotChip(),
                          TimeSlotChip(),
                          TimeSlotChip(),
                          TimeSlotChip(),
                          TimeSlotChip(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Next",
                  style: AppTheme.primaryHeadingTextSmallWhite,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TimeSlotChip extends StatelessWidget {
  const TimeSlotChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 90,
        height: 36,
        decoration: BoxDecoration(
            border: Border.all(
              color: AppTheme.primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(
            "08:00 AM",
            style: AppTheme.primaryBodyTextLargeBlue.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
