import 'package:alemeno/features/cart/presentation/views/cart_view.dart';
import 'package:alemeno/features/home/presentation/widgets/testcard_widget.dart';
import 'package:alemeno/utils/assets.dart';
import 'package:alemeno/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  static String routeName = 'home-page';
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("LOGO"),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, CartView.routeName),
            icon: SvgPicture.asset(Assets.cartIcon),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppTheme.pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular lab tests",
                    style: AppTheme.primaryHeadingTextMedium.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "View more",
                        style: AppTheme.primaryBodyTextSmallBlue,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 14,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 140 / 160,
                  crossAxisCount: 2, // number of items in each row
                  mainAxisSpacing: 14.0, // spacing between rows
                  crossAxisSpacing: 14.0, // spacing between columns
                ), // padding around the grid
                itemCount: 4, // total number of items
                itemBuilder: (context, index) {
                  return const TestCardWidget();
                },
              ),
              Text(
                "Popular lab tests",
                style: AppTheme.primaryHeadingTextMedium.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: Container(
                    width: 278,
                    height: 261,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: const Color(0xffDBDDE0),
                        width: 0.75,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: AppTheme.accentBackgroundColor,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SvgPicture.asset(
                                    Assets.bottleIcon,
                                    width: 30,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppTheme.accentColor,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        Assets.shieldIcon,
                                        width: 9,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        "Safe",
                                        style: TextStyle(
                                          color: AppTheme.whiteColor,
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Full Body checkup",
                            style: AppTheme.primaryHeadingTextSmall
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Includes 92 tests",
                                style: AppTheme.primaryBodyTextSmallBlue
                                    .copyWith(color: const Color(0xff6C87AE)),
                              ),
                              Text(
                                " • Blood Glucose Fasting",
                                style: AppTheme.primaryBodyTextSmallBlue
                                    .copyWith(color: const Color(0xff6C87AE)),
                              ),
                              Text(
                                " • Liver Function Test",
                                style: AppTheme.primaryBodyTextSmallBlue
                                    .copyWith(color: const Color(0xff6C87AE)),
                              ),
                              Text(
                                "View more",
                                style:
                                    AppTheme.primaryBodyTextSmallBlue.copyWith(
                                  color: const Color(0xff6C87AE),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "₹ 2000/-",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.accentColor,
                                ),
                              ),
                              InkWell(
                                child: Container(
                                  height: 33,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: AppTheme.primaryColor,
                                        width: 0.5,
                                      )),
                                  child: const Center(
                                    child: Text(
                                      "Add to cart",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppTheme.primaryColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {},
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
