import '/app/modules/athlete_profile/data/repositories/i_datasources/i_update_workout_name_datasource.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/domain/i_repositories/i_update_workout_name_repository.dart';

class UpdateWorkoutNameRepository implements IUpdateWorkoutNameRepository{
  UpdateWorkoutNameRepository(this._iUpdateWorkoutNameDataSource);
  IUpdateWorkoutNameDataSource _iUpdateWorkoutNameDataSource;
  @override
  Future<ReturnData> call(int workoutID, String name) async {
    return await _iUpdateWorkoutNameDataSource(workoutID, name);
  }
  
}