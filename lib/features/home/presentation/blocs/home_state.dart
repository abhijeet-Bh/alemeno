part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadingFailure extends HomeState {
  final String err;
  const HomeLoadingFailure(this.err);
  @override
  List<Object> get props => [err];
}

class HomeLoaded extends HomeState {
  final List<TestEntity> tests;

  const HomeLoaded(this.tests);

  @override
  List<Object> get props => [tests];
}
