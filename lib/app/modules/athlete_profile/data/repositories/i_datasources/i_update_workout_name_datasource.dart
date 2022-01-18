import '/app/core/utils/return_data.dart';

abstract class IUpdateWorkoutNameDataSource{
  Future<ReturnData> call(int workoutID, String name);
}