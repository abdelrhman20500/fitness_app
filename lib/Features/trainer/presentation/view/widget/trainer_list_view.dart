import 'package:fitness_app/Features/trainer/data/model/trainer_model.dart';
import 'package:fitness_app/Features/trainer/presentation/view/widget/trainer_item.dart';
import 'package:flutter/material.dart';

class TrainerListView extends StatelessWidget {
  const TrainerListView({super.key, required this.model,});
  final List<TrainerModel> model;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: TrainerItem(
              imageUrl: model[index].image!,
              title: model[index].name!,
              rating: model[index].rating!,
              experienceYears: model[index].experienceYears!,
              specialty: model[index].specialty!,
            )
          );
        },
        childCount: model.length,
      ),
    );
  }
}
