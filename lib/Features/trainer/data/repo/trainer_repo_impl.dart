import 'package:dartz/dartz.dart';
import 'package:fitness_app/Core/error/failure.dart';
import 'package:fitness_app/Features/trainer/data/data_source/trainer_remote_data_source.dart';
import 'package:fitness_app/Features/trainer/data/model/trainer_model.dart';
import 'package:fitness_app/Features/trainer/domain/repo/trainer_repo.dart';

import '../../../../Core/error/exceptions.dart';

class TrainerRepoImpl extends TrainerRepo{
  final TrainerBaseRemoteDataSource trainerBaseRemoteDataSource;
  TrainerRepoImpl({required this.trainerBaseRemoteDataSource});
  @override
  Future<Either<Failure, List<TrainerModel>>> getTrainer()async{
    try {
      final result = await trainerBaseRemoteDataSource.trainerData();
      return right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message ?? "Server error"),);
    }
  }

}