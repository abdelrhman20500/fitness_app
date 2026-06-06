import 'package:fitness_app/Features/trainer/data/model/trainer_model.dart';

abstract class TrainerState{}
class TrainerInitial extends TrainerState{}
class TrainerLoading extends TrainerState{}
class TrainerFailure extends TrainerState{
  final String error;
  TrainerFailure({required this.error});
}
class TrainerSuccess extends TrainerState{
  final List<TrainerModel> trainerModel;
  TrainerSuccess({required this.trainerModel});
}