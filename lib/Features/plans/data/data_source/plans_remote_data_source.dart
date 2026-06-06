import 'package:fitness_app/Core/Api/api_consumer.dart';
import 'package:fitness_app/Core/Api/end_point.dart';
import 'package:fitness_app/Features/plans/data/model/plans_model.dart';
import '../../../../Core/error/error_model.dart';
import '../../../../Core/error/exceptions.dart';

abstract class PlansBaseRemoteDataSource{
  Future<List<PlansModel>> getPlansData();
}
class PlansRemoteDataSource extends PlansBaseRemoteDataSource{
  final ApiConsumer apiConsumer;

  PlansRemoteDataSource({required this.apiConsumer});
  @override
  Future<List<PlansModel>> getPlansData()async{
    try {
      var response = await apiConsumer.get(EndPoint.plans);
      List<dynamic> jsonData = response;
      return jsonData.map((e) => PlansModel.fromJson(e)).toList();
    } catch (e) {
      throw ServerException(errModel: ErrorModel(message: e.toString()));
    }
  }
}