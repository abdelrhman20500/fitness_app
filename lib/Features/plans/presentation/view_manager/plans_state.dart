import 'package:fitness_app/Features/plans/data/model/plans_model.dart';

abstract class PlansState{}
class PlansInitial extends PlansState{}
class PlansLoading extends PlansState{}
class PlansFailure extends PlansState{
  final String error;
  PlansFailure({required this.error});
}
class PlansSuccess extends PlansState{
  final List<PlansModel> plansModel;
  PlansSuccess({required this.plansModel});
}