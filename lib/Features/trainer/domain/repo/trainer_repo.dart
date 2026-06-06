import 'package:dartz/dartz.dart';
import 'package:fitness_app/Core/error/failure.dart';
import 'package:fitness_app/Features/trainer/data/model/trainer_model.dart';

abstract class TrainerRepo{
  Future<Either<Failure, List<TrainerModel>>> getTrainer();
}