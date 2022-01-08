import '/app/modules/manage_workouts_by_team/domain/i_repositories/i_create_workout_repository.dart';
import '/app/core/utils/return_data.dart';
import '/app/domain/entitities/workout_entity.dart';

class CreateWorkoutUseCase{
 CreateWorkoutUseCase(this._iCreateWorkoutRepository);
 ICreateWorkoutRepository _iCreateWorkoutRepository;
 Future<ReturnData<WorkoutEntity>> call(WorkoutEntity workout) async {
   return await _iCreateWorkoutRepository(workout);
 }
}