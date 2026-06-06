import 'package:dartz/dartz.dart';
import 'package:fitness_app/Core/base_use_case/base_use_case.dart';
import 'package:fitness_app/Core/error/failure.dart';
import 'package:fitness_app/Features/plans/data/model/plans_model.dart';
import 'package:fitness_app/Features/plans/domain/repo/plans_repo.dart';

class PlansUseCase extends BaseUseCase<List<PlansModel>, NoParameters>{

  final PlansRepo plansRepo;

  PlansUseCase(this.plansRepo);
  @override
  Future<Either<Failure, List<PlansModel>>> call(NoParameters parameters)async{
    return await plansRepo.getPlans();
  }
}