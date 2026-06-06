import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness_app/Features/plans/presentation/view_manager/plans_cubit.dart';
import 'package:fitness_app/Features/plans/presentation/view_manager/plans_state.dart';
import 'package:fitness_app/Features/plans/presentation/view/widget/plans_list_view.dart';
import '../../../../Core/Api/dio_consumer.dart';
import '../../data/data_source/plans_remote_data_source.dart';
import '../../data/repo/plans_repo_impl.dart';
import '../../domain/use_case/plans_use_case.dart';

class PlansView extends StatelessWidget {
  const PlansView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => PlansCubit(PlansUseCase(PlansRepoImpl(plansBaseRemoteDataSource:
      PlansRemoteDataSource(apiConsumer: DioConsumer(dio: Dio())))))..plansData(),
      child: BlocBuilder<PlansCubit, PlansState>(
        builder: (context, state) {
          if (state is PlansLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PlansFailure) {
            return Center(child: Text(state.error));
          } else if (state is PlansSuccess) {
            if (state.plansModel.isEmpty) {
              return const Center(
                child: Text("Not Available Plans",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
              );
            }
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: height * 0.01),
                        const Text("Find Your Plan",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,),),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  sliver: PlansListView(model: state.plansModel),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
