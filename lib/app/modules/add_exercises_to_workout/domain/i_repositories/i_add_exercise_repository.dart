import '/app/domain/entitities/exercise_entity.dart';
import '/app/core/utils/return_data.dart';

abstract class IAddExerciseRepository{
  Future<ReturnData> call(int workoutID, int type, ExerciseEntity exercise);
}