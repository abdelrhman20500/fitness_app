import 'package:dartz/dartz.dart';
import 'package:fitness_app/Core/error/failure.dart';
import 'package:fitness_app/Features/plans/data/model/plans_model.dart';

abstract class PlansRepo{
  Future<Either<Failure, List<PlansModel>>> getPlans();
}