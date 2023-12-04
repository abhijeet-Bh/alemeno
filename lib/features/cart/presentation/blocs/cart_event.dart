part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class AddTestToCartEvent extends CartEvent {
  final TestEntity test;
  const AddTestToCartEvent(this.test);
  @override
  List<Object> get props => [test];
}

class ScheduleTestEvent extends CartEvent {
  @override
  List<Object> get props => [];
}
