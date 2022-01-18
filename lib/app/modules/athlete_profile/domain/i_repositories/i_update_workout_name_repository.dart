import 'package:treinif/app/core/utils/return_data.dart';

abstract class IUpdateWorkoutNameRepository{
  Future<ReturnData> call(int workoutID, String name);
}