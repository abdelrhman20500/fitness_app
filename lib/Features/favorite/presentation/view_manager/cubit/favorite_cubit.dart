import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/cached/shared_pref.dart';
import '../../../../plans/data/model/plans_model.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  List<PlansModel> favoritePlans = [];
  static FavoriteCubit get(BuildContext context) => BlocProvider.of(context);


  Future<void> loadFavorites() async {
    emit(FavoriteLoading());
    try {
      favoritePlans = await FavoriteLocalStorage.loadFavorites();
      emit(FavoriteSuccess(favoritePlans: favoritePlans));
    } catch (e) {
      emit(FavoriteFailure(errMessage: e.toString()));
    }
  }

  Future<void> toggleFavorite({required PlansModel plan}) async {
    try {
      final index = favoritePlans.indexWhere((p) => p.id == plan.id);
      if (index != -1) {
        favoritePlans.removeAt(index);
        emit(FavoriteRemoved(planId: plan.id!));
      } else {
        favoritePlans.add(plan);
        emit(FavoriteAdded(planId: plan.id!));
      }

      await FavoriteLocalStorage.saveFavorites(favoritePlans);
      emit(FavoriteSuccess(favoritePlans: favoritePlans));
    } catch (e) {
      emit(FavoriteFailure(errMessage: e.toString()));
    }
  }

  bool isFavorite(int planId) => favoritePlans.any((p) => p.id == planId);

  Future<void> clearFavorites() async {
    try {
      favoritePlans.clear();
      await FavoriteLocalStorage.clearFavorites();
      emit(FavoriteCleared());
      emit(FavoriteSuccess(favoritePlans: favoritePlans));
    } catch (e) {
      emit(FavoriteFailure(errMessage: e.toString()));
    }
  }
}
