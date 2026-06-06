import 'package:fitness_app/Features/plans/data/model/plans_model.dart';
import 'package:fitness_app/Features/plans/presentation/view/widget/plans_item.dart';
import 'package:flutter/material.dart';

class PlansListView extends StatelessWidget {
  const PlansListView({super.key, required this.model});
  final List<PlansModel> model;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: PlansItem(
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
