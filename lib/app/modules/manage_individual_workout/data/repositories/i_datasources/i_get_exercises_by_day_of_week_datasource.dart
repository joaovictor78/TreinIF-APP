import '/app/core/utils/return_data.dart';
import '/app/domain/entitities/exercise_entity.dart';

abstract class IGetExercisesByDayOfWeekDataSource{
  Future<ReturnData<List<ExerciseEntity>>> call(int workoutID, String dayOfWeek, int type);
}