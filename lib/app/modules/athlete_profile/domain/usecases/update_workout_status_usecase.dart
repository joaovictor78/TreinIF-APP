import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/domain/i_repositories/i_update_workout_status_repository.dart';

class UpdateWorkoutStatusUseCase{ 
  IUpdateWorkoutStatusRepository _iUpdateWorkoutStatusRepository;
  UpdateWorkoutStatusUseCase(this._iUpdateWorkoutStatusRepository);
  
  Future<ReturnData> call(int workoutID) async {
    return await _iUpdateWorkoutStatusRepository(workoutID);
  }
}