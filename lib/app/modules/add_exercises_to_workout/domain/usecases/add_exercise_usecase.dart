import '/app/modules/add_exercises_to_workout/domain/i_repositories/i_add_exercise_repository.dart';
import '/app/core/utils/return_data.dart';

class AddExerciseUseCase{
  IAddExerciseRepository _iAddExerciseRepository;
  AddExerciseUseCase(this._iAddExerciseRepository);
  Future<ReturnData> call() async {
     return await _iAddExerciseRepository();
  }
}