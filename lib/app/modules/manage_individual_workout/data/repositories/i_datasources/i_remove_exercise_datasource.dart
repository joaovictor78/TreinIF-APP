import 'package:treinif/app/core/utils/return_data.dart';

abstract class IRemoveExerciseDataSource{
  Future<ReturnData> call(int workoutID, int exerciseID);
}