import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/test_entity.dart';
import '../../domain/usecases/homepage_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // HomePageUseCase homePageUseCase = HomePageUseCase();
  final HomePageUseCase _homePageUseCase;

  HomeBloc({required HomePageUseCase homePageUseCase})
      : _homePageUseCase = homePageUseCase,
        super(HomeInitial()) {
    on<LoadHomeDataEvent>((event, emit) async {
      emit(HomeLoading());
      var tests = await _homePageUseCase.fetchHomePageData();
      tests.fold(
        (l) => emit(const HomeLoadingFailure("Failed to load data!")),
        (r) => emit(HomeLoaded(r)),
      );
    });
  }
}
