import 'package:treinif/app/core/utils/return_data.dart';

abstract class IAddExerciseDataSource{
  Future<ReturnData> call();
}