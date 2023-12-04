part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}

class AddingTestState extends CartState {
  final String testId;
  const AddingTestState(this.testId);
  @override
  List<Object> get props => [testId];
}

class SchedulingTestState extends CartState {
  @override
  List<Object> get props => [];
}

class SchedulingTestSuccessState extends CartState {
  final TestEntity test;
  const SchedulingTestSuccessState(this.test);
  @override
  List<Object> get props => [];
}

class AddingTestFailureState extends CartState {
  @override
  List<Object> get props => [];
}

class AddedTestState extends CartState {
  final String testId;
  const AddedTestState(this.testId);
  @override
  List<Object> get props => [testId];
}
