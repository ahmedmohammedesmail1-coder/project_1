import 'package:dart_either/dart_either.dart';
import 'package:project_1/core/network/remote/api_endpoint.dart';
import 'package:project_1/core/network/remote/dio_helper.dart';
import 'package:project_1/features/silver/data/models/silver_model.dart';

class SilverRepo 
{
 Future<Either<String,SilverModel>> getData()async
  {
  try {
  final res = await DioHelper.get(endPoint: silverEndpoint);
  return Right(SilverModel.fromJson(res.data));
} catch (e) {
  return Left(e.toString());
}
  }
}