import 'package:fitness_app/Features/trainer/data/model/trainer_model.dart';

import '../../../../Core/Api/api_consumer.dart';
import '../../../../Core/Api/end_point.dart';
import '../../../../Core/error/error_model.dart';
import '../../../../Core/error/exceptions.dart';

abstract class TrainerBaseRemoteDataSource{
  Future<List<TrainerModel>> trainerData();
}
class TrainerRemoteDataSource extends TrainerBaseRemoteDataSource{
  final ApiConsumer apiConsumer;
  TrainerRemoteDataSource({required this.apiConsumer});

  @override
  Future<List<TrainerModel>> trainerData()async{
    try {
      final response = await apiConsumer.get(EndPoint.trainers);
      final List<dynamic> dataList = response['trainers'];
      print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55");
      print(dataList);
      return dataList.map((e) => TrainerModel.fromJson(e)).toList();
    } catch (e) {
      throw ServerException(errModel: ErrorModel(message: e.toString()));
    }
  }

}