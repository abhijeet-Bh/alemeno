import 'package:alemeno/features/cart/presentation/blocs/cart_bloc.dart';
import 'package:alemeno/features/cart/presentation/views/cart_view.dart';
import 'package:alemeno/features/cart/presentation/views/date_time_view.dart';
import 'package:alemeno/features/home/presentation/blocs/home_bloc.dart';
import 'package:alemeno/utils/injection.dart';
import 'package:alemeno/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/home/presentation/views/home_page_view.dart';

void main() async {
  //dependency Injection
  await init();
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
        HomePage.routeName: (_) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => sl<HomeBloc>(),
                ),
                BlocProvider(
                  create: (context) => sl<CartBloc>(),
                ),
              ],
              child: const HomePage(),
            ),
        CartView.routeName: (_) => BlocProvider(
              create: (context) => sl<CartBloc>(),
              child: const CartView(),
            ),
        DateTimeView.routeName: (_) => const DateTimeView(),
      },
    );
  }
}
