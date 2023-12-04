import 'package:alemeno/features/cart/presentation/blocs/cart_bloc.dart';
import 'package:alemeno/features/home/domain/entities/test_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/assets.dart';
import '../../../../utils/theme.dart';

class TestCardWidget extends StatefulWidget {
  final TestEntity test;

  const TestCardWidget({super.key, required this.test});

  @override
  State<TestCardWidget> createState() => _TestCardWidgetState();
}

int btnIndex = 0;
List<Widget> btns = const [AddToCartBtn(), AddingToCartBtn(), AddedToCartBtn()];

class _TestCardWidgetState extends State<TestCardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 160,
      child: Column(
        children: [
          Container(
            height: 32,
            decoration: const BoxDecoration(
              color: AppTheme.blueColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            child: Center(
              child: Text(
                widget.test.title,
                style: AppTheme.primaryBodyTextSmall.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                border: Border.all(
                  color: const Color.fromARGB(255, 209, 209, 209),
                  width: 0.5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Includes ${widget.test.numberOfTests} tests",
                          style: AppTheme.primaryBodyTextMediumBlue,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppTheme.accentColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: SvgPicture.asset(
                              Assets.shieldIcon,
                              width: 11,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Get reports in 24 hours",
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 7,
                          ),
                        ),
                        Text(
                          widget.test.offerPrice.toString(),
                          style: const TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if ((state is AddingTestState) &&
                            (state.testId == widget.test.id)) {
                          return btns[1];
                        } else if ((state is AddedTestState) &&
                            (state.testId == widget.test.id)) {
                          return btns[2];
                        } else {
                          return InkWell(
                            child: btns[btnIndex],
                            onTap: () {
                              setState(() {
                                BlocProvider.of<CartBloc>(context)
                                    .add(AddTestToCartEvent(widget.test));
                              });
                            },
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      child: Container(
                        width: double.infinity,
                        height: 26,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: AppTheme.primaryColor,
                              width: 0.5,
                            )),
                        child: const Center(
                          child: Text(
                            "View Details",
                            style: TextStyle(
                              fontSize: 8,
                              color: AppTheme.primaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//Add to cart Button
class AddToCartBtn extends StatelessWidget {
  const AddToCartBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 26,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppTheme.primaryColor,
      ),
      child: const Center(
        child: Text(
          "Add to cart",
          style: TextStyle(
            fontSize: 8,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

//Adding to Cart Btn
class AddingToCartBtn extends StatelessWidget {
  const AddingToCartBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 26,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xffB0B0B0),
      ),
      child: const Center(
        child: Text(
          "Adding to cart",
          style: TextStyle(
            fontSize: 8,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

//Added to Cart Button
class AddedToCartBtn extends StatelessWidget {
  const AddedToCartBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 26,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppTheme.accentColor,
      ),
      child: const Center(
        child: Text(
          "Added to cart",
          style: TextStyle(
            fontSize: 8,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
