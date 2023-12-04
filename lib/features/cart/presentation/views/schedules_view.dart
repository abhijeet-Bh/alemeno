import 'package:alemeno/features/home/presentation/views/home_page_view.dart';
import 'package:alemeno/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/theme.dart';

class ScheduledView extends StatelessWidget {
  static String routeName = 'confirm-page';
  final String date;
  final String time;
  const ScheduledView({
    required this.date,
    required this.time,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: AppTheme.accentColor,
            ),
          )
        ],
        leading: const Text(""),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 417,
            width: 330,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color.fromARGB(255, 209, 209, 209),
                width: 0.5,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    Assets.scheduledIcon,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Lab tests have been scheduled successfully, You will receive a mail of the same. ",
                    style: AppTheme.primaryBodyTextLargeBlue.copyWith(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "$date | $time",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  )
                ],
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
                    "Back to home",
                    style: AppTheme.primaryHeadingTextSmallWhite,
                  ),
                ),
              ),
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                HomePage.routeName,
                (route) => false,
              ),
            ),
          )
        ],
      ),
    );
  }
}
