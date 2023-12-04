import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/domain/entities/test_entity.dart';
import '../../domain/usecases/cart_usecase.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartUseCase cartUseCase = CartUseCase();

  CartBloc() : super(CartInitial()) {
    on<AddTestToCartEvent>((event, emit) async {
      emit(AddingTestState(event.test.id));
      var cart = await cartUseCase.addTestToCart(event.test);

      cart.fold(
        (l) => emit(AddingTestFailureState()),
        (r) => emit(AddedTestState(r.id)),
      );
    });
  }
}
