import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Features/plans/data/model/plans_model.dart';

class FavoriteLocalStorage {
  static const String _favoritesKey = 'favorite_plans';

  /// حفظ المفضلة
  static Future<void> saveFavorites(List<PlansModel> plans) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favoritesList =
    plans.map((p) => jsonEncode(p.toJson())).toList();
    await prefs.setStringList(_favoritesKey, favoritesList);
  }

  /// تحميل المفضلة
  static Future<List<PlansModel>> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? savedFavorites = prefs.getStringList(_favoritesKey);

    if (savedFavorites != null && savedFavorites.isNotEmpty) {
      return savedFavorites
          .map((json) => PlansModel.fromJson(jsonDecode(json)))
          .toList();
    }
    return [];
  }

  /// مسح المفضلة
  static Future<void> clearFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_favoritesKey);
  }
}
