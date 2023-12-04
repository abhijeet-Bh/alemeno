import 'package:alemeno/features/home/domain/usecases/homepage_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/test_entity.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomePageUseCase homePageUseCase = HomePageUseCase();

  HomeBloc() : super(HomeInitial()) {
    on<LoadHomeDataEvent>((event, emit) async {
      emit(HomeLoading());
      var tests = await homePageUseCase.fetchHomePageData();
      tests.fold(
        (l) => emit(const HomeLoadingFailure("Failed to load data!")),
        (r) => emit(HomeLoaded(r)),
      );
    });
  }
}
