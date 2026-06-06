import 'package:dartz/dartz.dart';
import 'package:fitness_app/Core/base_use_case/base_use_case.dart';
import 'package:fitness_app/Core/error/failure.dart';
import 'package:fitness_app/Features/trainer/data/model/trainer_model.dart';
import 'package:fitness_app/Features/trainer/domain/repo/trainer_repo.dart';

class TrainerUseCase extends BaseUseCase<List<TrainerModel>, NoParameters>{
  final TrainerRepo trainerRepo;

  TrainerUseCase(this.trainerRepo);
  @override
  Future<Either<Failure, List<TrainerModel>>> call(NoParameters parameters)async{
    return await trainerRepo.getTrainer();
  }
}