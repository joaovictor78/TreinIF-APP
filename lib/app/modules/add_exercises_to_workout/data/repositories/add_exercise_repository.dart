import '/app/modules/add_exercises_to_workout/data/repositories/i_datasources/i_add_exercise_datasource.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/add_exercises_to_workout/domain/i_repositories/i_add_exercise_repository.dart';

class AddExerciseRepository implements IAddExerciseRepository{
  IAddExerciseDataSource _iAddExerciseDataSource;
  AddExerciseRepository(this._iAddExerciseDataSource);
  @override
  Future<ReturnData> call() async {
    return await _iAddExerciseDataSource();
  }

}