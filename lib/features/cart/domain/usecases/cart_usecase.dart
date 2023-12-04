import 'package:alemeno/features/cart/domain/repositories/cart_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../utils/failure.dart';
import '../../../home/domain/entities/test_entity.dart';

class CartUseCase {
  const CartUseCase(this._repository);
  final CartRepository _repository;

  // final CartRepository _repository = CartRepositoryIml();

  Future<Either<Failure, TestEntity>> addTestToCart(TestEntity test) async =>
      _repository.addTestToCart(test);

  Future<Either<Failure, TestEntity>> scheduleTest() async =>
      _repository.scheduleTest();
}
