import 'package:alemeno/features/home/data/models/test_model.dart';
import 'package:alemeno/features/home/domain/entities/test_entity.dart';
import 'package:alemeno/features/home/domain/repositories/homepage_repository.dart';
import 'package:alemeno/utils/failure.dart';
import 'package:dartz/dartz.dart';

import '../datasources/mock_test_data.dart';

class HomePageRepositoryIml extends HomePageRepository {
  @override
  Future<Either<Failure, List<TestEntity>>> getHomePageData() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    List<TestEntity> tests = [];

    for (var test in Database.testsData) {
      tests.add(Test.fromJson(test).modelToEntity());
    }

    return Right(tests);
  }
}
