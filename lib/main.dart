import 'package:alemeno/features/cart/presentation/views/cart_view.dart';
import 'package:alemeno/utils/theme.dart';
import 'package:flutter/material.dart';

import 'features/home/presentation/views/home_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => const HomePage(),
        CartView.routeName: (_) => const CartView(),
      },
    );
  }
}
