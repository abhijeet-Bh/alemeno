import 'package:alemeno/features/home/domain/entities/test_entity.dart';
import 'package:alemeno/utils/cart_service.dart';
import 'package:alemeno/utils/failure.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/cart_repository.dart';

class CartRepositoryIml extends CartRepository {
  CartService cartService = CartService();

  @override
  Future<Either<Failure, TestEntity>> addTestToCart(TestEntity test) async {
    await Future.delayed(const Duration(milliseconds: 1000));

    cartService.setTest(test);

    return Right(test);
  }

  @override
  Future<Either<Failure, TestEntity>> scheduleTest() async {
    await Future.delayed(const Duration(seconds: 2));

    TestEntity test = cartService.getTest;
    cartService.emptyCart();

    return Right(test);
  }
}
