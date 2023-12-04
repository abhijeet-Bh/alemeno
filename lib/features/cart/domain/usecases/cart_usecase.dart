import 'package:dartz/dartz.dart';

import '../../../../utils/failure.dart';
import '../../../home/domain/entities/test_entity.dart';
import '../../data/repositories/cart_repository_impl.dart';
import '../repositories/cart_repository.dart';

class CartUseCase {
  // const HomePageUseCase(this._repository);
  // final HomePageRepository _repository;

  final CartRepository _repository = CartRepositoryIml();

  Future<Either<Failure, TestEntity>> addTestToCart(TestEntity test) async =>
      _repository.addTestToCart(test);
}
