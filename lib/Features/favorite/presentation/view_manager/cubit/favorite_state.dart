import '../../../../plans/data/model/plans_model.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteFailure extends FavoriteState {
  final String errMessage;
  FavoriteFailure({required this.errMessage});
}

class FavoriteSuccess extends FavoriteState {
  final List<PlansModel> favoritePlans;
  FavoriteSuccess({required this.favoritePlans});
}

class FavoriteAdded extends FavoriteState {
  final int planId;
  FavoriteAdded({required this.planId});
}

class FavoriteRemoved extends FavoriteState {
  final int planId;
  FavoriteRemoved({required this.planId});
}

class FavoriteCleared extends FavoriteState {}

