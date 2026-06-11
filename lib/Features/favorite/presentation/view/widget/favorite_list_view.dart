import 'package:fitness_app/Features/favorite/presentation/view/widget/favorite_item.dart';
import 'package:fitness_app/Features/plans/data/model/plans_model.dart';
import 'package:flutter/material.dart';

class FavoriteListView extends StatelessWidget {
  const FavoriteListView({super.key, required this.model});
  final List<PlansModel> model;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: FavoriteItem(
              plan: model[index],
              title: model[index].name!,
              id: model[index].id!,
              imageUrl: model[index].image!,
              description: model[index].description!,
              durationWeeks: model[index].durationWeeks!,
              level: model[index].level!,
            ),
          );
        },
        childCount: model.length,
      ),
    );
  }
}
