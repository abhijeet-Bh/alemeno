import 'package:alemeno/features/home/data/repositories/homepage_repository_impl.dart';
import 'package:alemeno/features/home/domain/entities/test_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../utils/failure.dart';
import '../repositories/homepage_repository.dart';

class HomePageUseCase {
  // const HomePageUseCase(this._repository);
  // final HomePageRepository _repository;

  final HomePageRepository _repository = HomePageRepositoryIml();

  Future<Either<Failure, List<TestEntity>>> fetchHomePageData() async =>
      _repository.getHomePageData();
}
