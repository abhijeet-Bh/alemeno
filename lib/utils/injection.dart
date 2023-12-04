import 'package:alemeno/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:alemeno/features/cart/domain/repositories/cart_repository.dart';
import 'package:alemeno/features/cart/domain/usecases/cart_usecase.dart';
import 'package:alemeno/features/cart/presentation/blocs/cart_bloc.dart';
import 'package:alemeno/features/home/data/repositories/homepage_repository_impl.dart';
import 'package:alemeno/features/home/domain/repositories/homepage_repository.dart';
import 'package:alemeno/features/home/domain/usecases/homepage_usecase.dart';
import 'package:alemeno/features/home/presentation/blocs/home_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  //Blocs
  sl.registerFactory(() => HomeBloc(homePageUseCase: sl()));
  sl.registerFactory(() => CartBloc(cartUseCase: sl()));

  //UseCases
  sl.registerLazySingleton(() => HomePageUseCase(sl()));
  sl.registerLazySingleton(() => CartUseCase(sl()));

  //Repositories
  sl.registerLazySingleton<HomePageRepository>(() => HomePageRepositoryIml());
  sl.registerLazySingleton<CartRepository>(() => CartRepositoryIml());
}
