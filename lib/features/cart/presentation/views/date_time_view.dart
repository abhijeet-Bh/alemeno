import 'package:alemeno/utils/cart_service.dart';
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

int currIndex = -1;

final times = [
  '08:00 AM',
  '09:00 AM',
  '10:00 AM',
  '11:00 AM',
  '12:00 PM',
  '01:00 PM',
  '02:00 PM',
  '03:00 PM',
  '04:00 PM',
  '05:00 PM',
  '06:00 PM',
  '07:00 PM',
];

CartService _cartService = CartService();

class _DateTimeViewState extends State<DateTimeView> {
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    _cartService.setDate(currentDate.toLocal().toString().split(' ')[0]);
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
                      onDateChanged: (sldate) {
                        currentDate = sldate;
                        _cartService
                            .setDate(sldate.toLocal().toString().split(' ')[0]);
                      },
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
                    SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        runAlignment: WrapAlignment.spaceBetween,
                        runSpacing: 13,
                        spacing: 33,
                        children: times
                            .map(
                              (e) => InkWell(
                                  child: TimeSlotChip(
                                    index: times.indexOf(e),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      currIndex = times.indexOf(e);
                                      _cartService
                                          .setTime(times[times.indexOf(e)]);
                                    });
                                  }),
                            )
                            .toList(),
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
            child: InkWell(
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
              onTap: () => Navigator.pop(context, currentDate),
            ),
          )
        ],
      ),
    );
  }
}

class TimeSlotChip extends StatelessWidget {
  final int index;
  const TimeSlotChip({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 36,
      decoration: BoxDecoration(
          color:
              (currIndex == index) ? AppTheme.primaryColor : Colors.transparent,
          border: Border.all(
            color: AppTheme.primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Text(
          times[index],
          style: AppTheme.primaryBodyTextLargeBlue.copyWith(
            color: (currIndex == index)
                ? AppTheme.whiteColor
                : AppTheme.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
