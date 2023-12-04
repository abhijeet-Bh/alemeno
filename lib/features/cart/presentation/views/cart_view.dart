import 'package:alemeno/features/cart/presentation/blocs/cart_bloc.dart';
import 'package:alemeno/features/cart/presentation/views/date_time_view.dart';
import 'package:alemeno/features/cart/presentation/views/schedules_view.dart';
import 'package:alemeno/features/home/domain/entities/test_entity.dart';
import 'package:alemeno/utils/cart_service.dart';
import 'package:alemeno/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/assets.dart';
import '../widgets/cart_test_widget.dart';

class CartView extends StatefulWidget {
  static String routeName = 'cart=page';
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  DateTime? selctedDate;
  CartService cartService = CartService();
  String? date;
  String? time;
  bool hardCopy = false;

  void _picDateTime() async {
    await Navigator.pushNamed(context, DateTimeView.routeName);

    // Update the state or perform any refresh logic when PageB is popped
    setState(() {
      // selctedDate = result as DateTime;
      // debugPrint(selctedDate?.toLocal().toString().split(' ')[0]);
      date = cartService.getDate;
      time = cartService.getTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    TestEntity? test = cartService.getTest;
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
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if (state is SchedulingTestState) {
            showDialog(
              context: context,
              builder: (_) => const SimpleDialog(
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                ],
              ),
            );
          } else if (state is SchedulingTestSuccessState) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (_) => ScheduledView(
                          date: date!,
                          time: time!,
                        )),
                (route) => false);
          }
        },
        builder: (context, state) {
          debugPrint(state.toString());
          if (state is CartInitial && !cartService.isCartEmpty()) {
            return Column(
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
                          CartTestCard(
                            test: test!,
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
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 209, 209, 209),
                                            width: 0.5,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            "${cartService.getDate} (${cartService.getTime})" ??
                                                "Select date",
                                            style: TextStyle(
                                              color:
                                                  (cartService.getDate != null)
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Expanded(
                                        child: Text(
                                          "M.R.P Total",
                                          style:
                                              AppTheme.primaryBodyTextSmallBlue,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        test.offerPrice.toString(),
                                        style:
                                            AppTheme.primaryBodyTextSmallBlue,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Discount",
                                          style:
                                              AppTheme.primaryBodyTextSmallBlue,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "- 400",
                                        style:
                                            AppTheme.primaryBodyTextSmallBlue,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Amount to be paid",
                                          style: AppTheme
                                              .primaryHeadingTextSmall
                                              .copyWith(fontSize: 14),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "${(test.offerPrice) - 400}",
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
                                          style: AppTheme
                                              .primaryBodyTextSmallBlue),
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
                                    value: hardCopy,
                                    onChanged: (val) {
                                      setState(() {
                                        hardCopy = val!;
                                      });
                                    },
                                  ),
                                  const Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 20, top: 10),
                  child: InkWell(
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: (!cartService.isDateTimeEmpty())
                            ? AppTheme.primaryColor
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Schedule",
                          style: AppTheme.primaryHeadingTextSmallWhite,
                        ),
                      ),
                    ),
                    onTap: () {
                      if (!cartService.isDateTimeEmpty()) {
                        BlocProvider.of<CartBloc>(context)
                            .add(ScheduleTestEvent());
                      }
                    },
                  ),
                )
              ],
            );
          } else {
            return const Center(
              child: Text("Your Cart Seems Empty :("),
            );
          }
        },
      ),
    );
  }
}
