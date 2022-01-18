import '/app/modules/athlete_profile/domain/i_repositories/i_update_individual_workout_status_repository.dart';
import '/app/core/utils/return_data.dart';
import 'i_datasources/i_update_individual_workout_status_datasource.dart';

class UpdateIndividualWorkoutStatusRepository implements IUpdateIndividualWorkoutStatusRepository{
  UpdateIndividualWorkoutStatusRepository(this._iUpdateWorkoutStatusDataSource);
  IUpdateIndividualWorkoutStatusDataSource _iUpdateWorkoutStatusDataSource;

  Future<ReturnData> call(int workoutID) async { 
    return await _iUpdateWorkoutStatusDataSource(workoutID);
  }
}