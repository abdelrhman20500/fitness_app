import 'package:dartz/dartz.dart';
import 'package:fitness_app/Core/error/failure.dart';
import 'package:fitness_app/Features/plans/data/data_source/plans_remote_data_source.dart';
import 'package:fitness_app/Features/plans/data/model/plans_model.dart';
import 'package:fitness_app/Features/plans/domain/repo/plans_repo.dart';

import '../../../../Core/error/exceptions.dart';

class PlansRepoImpl extends PlansRepo{
  final PlansBaseRemoteDataSource plansBaseRemoteDataSource;

  PlansRepoImpl({required this.plansBaseRemoteDataSource});
  @override
  Future<Either<Failure, List<PlansModel>>> getPlans()async {
    try {
      final result = await plansBaseRemoteDataSource.getPlansData();
      return right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message ?? "Server error"),);
    }
  }
}