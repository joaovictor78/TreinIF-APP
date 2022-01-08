import 'package:treinif/app/core/utils/return_data.dart';
import 'package:treinif/app/domain/entitities/workout_entity.dart';

abstract class IGetAllWorkoutsOfTeamDataSource{
  Future<ReturnData<List<WorkoutEntity>>> call();
}