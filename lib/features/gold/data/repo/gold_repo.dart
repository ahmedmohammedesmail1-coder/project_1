import 'package:dart_either/dart_either.dart';
import 'package:project_1/core/network/remote/api_endpoint.dart';
import 'package:project_1/core/network/remote/dio_helper.dart';
import 'package:project_1/features/gold/data/models/gold_model.dart';

class GoldRepo 
{
 Future<Either<String,GoldModel>> getData()async
  {
  try {
  final res = await DioHelper.get(endPoint: goldEndpoint);
  return Right(GoldModel.fromJson(res.data));
} catch (e) {
  return Left(e.toString());
}
  }
}