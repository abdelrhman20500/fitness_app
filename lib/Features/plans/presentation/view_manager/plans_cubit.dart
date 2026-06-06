import 'package:fitness_app/Features/plans/domain/use_case/plans_use_case.dart';
import 'package:fitness_app/Features/plans/presentation/view_manager/plans_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/base_use_case/base_use_case.dart';

class PlansCubit extends Cubit<PlansState>{
  PlansCubit(this.plansUseCase) :super(PlansInitial());
  final PlansUseCase plansUseCase;
  Future<void> plansData()async{
    emit(PlansLoading());
    var result = await plansUseCase.call(const NoParameters());
    result.fold((e){
      emit(PlansFailure(error: e.message));
    },(plansModel){
      emit(PlansSuccess(plansModel: plansModel));
    });
  }
}