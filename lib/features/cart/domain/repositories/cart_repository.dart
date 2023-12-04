import 'package:dartz/dartz.dart';

import '../../../../utils/failure.dart';
import '../../../home/domain/entities/test_entity.dart';

abstract class CartRepository {
  const CartRepository();

  Future<Either<Failure, TestEntity>> addTestToCart(TestEntity test);
}
