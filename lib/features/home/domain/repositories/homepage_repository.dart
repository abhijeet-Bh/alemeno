import 'package:dartz/dartz.dart';

import '../entities/test_entity.dart';
import '../../../../utils/failure.dart';

abstract class HomePageRepository {
  const HomePageRepository();

  Future<Either<Failure, List<TestEntity>>> getHomePageData();
}
