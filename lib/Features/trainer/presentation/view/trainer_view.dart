import 'package:dio/dio.dart';
import 'package:fitness_app/Features/trainer/data/data_source/trainer_remote_data_source.dart';
import 'package:fitness_app/Features/trainer/data/repo/trainer_repo_impl.dart';
import 'package:fitness_app/Features/trainer/domain/use_case/trainer_use_case.dart';
import 'package:fitness_app/Features/trainer/presentation/view/widget/trainer_list_view.dart';
import 'package:fitness_app/Features/trainer/presentation/view_manager/trainer_cubit.dart';
import 'package:fitness_app/Features/trainer/presentation/view_manager/trainer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/Api/dio_consumer.dart';


class TrainerView extends StatelessWidget {
  const TrainerView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => TrainerCubit(TrainerUseCase(TrainerRepoImpl(trainerBaseRemoteDataSource:
      TrainerRemoteDataSource(apiConsumer: DioConsumer(dio: Dio())))))..trainerData(),
      child: BlocBuilder<TrainerCubit, TrainerState>(
        builder: (context, state) {
          if (state is TrainerLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TrainerFailure) {
            return Center(child: Text(state.error));
          } else if (state is TrainerSuccess) {
            if (state.trainerModel.isEmpty) {
              return const Center(
                child: Text("Not Available Trainers",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
              );
            }
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: height * 0.01),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Featured Workout Plans",style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold,),),
                            Text("See All",style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w500,))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                TrainerListView(model: state.trainerModel),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
