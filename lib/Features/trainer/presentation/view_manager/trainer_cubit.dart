import 'package:fitness_app/Features/trainer/domain/use_case/trainer_use_case.dart';
import 'package:fitness_app/Features/trainer/presentation/view_manager/trainer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/base_use_case/base_use_case.dart';

class TrainerCubit extends Cubit<TrainerState>{
  TrainerCubit(this.trainerUseCase) :super(TrainerInitial());
  final TrainerUseCase trainerUseCase;
  Future<void> trainerData()async{
    emit(TrainerLoading());
    var result = await trainerUseCase.call(const NoParameters());
    result.fold((e){
      emit(TrainerFailure(error: e.message));
    },(trainerModel){
      emit(TrainerSuccess(trainerModel: trainerModel));
    });
  }
}