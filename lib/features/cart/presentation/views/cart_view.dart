import 'package:alemeno/features/cart/presentation/views/date_time_view.dart';
import 'package:alemeno/utils/cart_service.dart';
import 'package:alemeno/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/assets.dart';

class CartView extends StatefulWidget {
  static String routeName = 'cart=page';
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  DateTime? selctedDate;
  CartService _cartService = CartService();

  void _picDateTime() async {
    await Navigator.pushNamed(context, DateTimeView.routeName);

    // Update the state or perform any refresh logic when PageB is popped
    setState(() {
      // selctedDate = result as DateTime;
      // debugPrint(selctedDate?.toLocal().toString().split(' ')[0]);
    });
  }

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
                      "Order review",
                      style: AppTheme.primaryHeadingTextMedium.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 185,
                      child: Column(
                        children: [
                          Container(
                            height: 39,
                            decoration: const BoxDecoration(
                              color: AppTheme.blueColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Thyroid Profile",
                                style: AppTheme.primaryBodyTextLarge.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 209, 209, 209),
                                  width: 0.5,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 26,
                                  right: 26,
                                  top: 6,
                                  bottom: 11,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Thyroid Profile",
                                            style: TextStyle(
                                              color: AppTheme.primaryColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "₹ 2000/-",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: AppTheme.accentColor,
                                              ),
                                            ),
                                            Text(
                                              "1400",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 11,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      height: 34,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppTheme.primaryColor,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(Assets.deleteIcon),
                                            const SizedBox(
                                              width: 16,
                                            ),
                                            Text(
                                              "Remove",
                                              style: AppTheme
                                                  .primaryBodyTextLargeBlue
                                                  .copyWith(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      height: 34,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppTheme.primaryColor,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(Assets.shareIcon),
                                            const SizedBox(
                                              width: 16,
                                            ),
                                            Text(
                                              "Upload prescription (optional)",
                                              style: AppTheme
                                                  .primaryBodyTextLargeBlue
                                                  .copyWith(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color.fromARGB(255, 209, 209, 209),
                          width: 0.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 28),
                        child: Row(
                          children: [
                            SvgPicture.asset(Assets.calenderIcon),
                            const SizedBox(
                              width: 11,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: _picDateTime,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 209, 209, 209),
                                      width: 0.5,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      "${_cartService.getDate} (${_cartService.getTime})" ??
                                          "Select date",
                                      style: TextStyle(
                                        color: (_cartService.getDate != null)
                                            ? AppTheme.primaryColor
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color.fromARGB(255, 209, 209, 209),
                          width: 0.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    "M.R.P Total",
                                    style: AppTheme.primaryBodyTextSmallBlue,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "1400",
                                  style: AppTheme.primaryBodyTextSmallBlue,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Discount",
                                    style: AppTheme.primaryBodyTextSmallBlue,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "- 400",
                                  style: AppTheme.primaryBodyTextSmallBlue,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Amount to be paid",
                                    style: AppTheme.primaryHeadingTextSmall
                                        .copyWith(fontSize: 14),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "₹ 1000/-",
                                  style: AppTheme.primaryHeadingTextSmall
                                      .copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text("Total savings ",
                                    style: AppTheme.primaryBodyTextSmallBlue),
                                const SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  "₹ 400/-",
                                  style: AppTheme.primaryHeadingTextSmall
                                      .copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color.fromARGB(255, 209, 209, 209),
                          width: 0.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 28),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Checkbox(
                              shape: const CircleBorder(),
                              value: true,
                              onChanged: (val) {},
                            ),
                            const Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hard copy of reports",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: AppTheme.primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Reports will be delivered within 3-4 working days. Hard copy charges are non-refundable once the reports have been dispatched. ",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "₹150 per person",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.grey),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
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
                  "Schedule",
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
