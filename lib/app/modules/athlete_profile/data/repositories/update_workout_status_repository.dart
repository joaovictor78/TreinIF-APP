import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/data/repositories/i_datasources/i_update_workout_status_datasource.dart';

class UpdateWorkoutStatusRepository{
  UpdateWorkoutStatusRepository(this._iUpdateWorkoutStatusDataSource);
  IUpdateWorkoutStatusDataSource _iUpdateWorkoutStatusDataSource;

  Future<ReturnData> call(int workoutID) async { 
    return await _iUpdateWorkoutStatusDataSource(workoutID);
  }
}