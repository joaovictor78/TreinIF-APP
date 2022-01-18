import 'package:treinif/app/core/utils/return_data.dart';

abstract class IAddExerciseRepository{
  Future<ReturnData> call();
}