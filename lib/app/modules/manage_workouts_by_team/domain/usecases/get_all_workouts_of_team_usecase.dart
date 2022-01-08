import 'package:treinif/app/core/utils/return_data.dart';
import 'package:treinif/app/domain/entitities/workout_entity.dart';
import 'package:treinif/app/modules/manage_workouts_by_team/domain/i_repositories/i_get_all_workouts_of_team_repository.dart';

class GetAllWorkoutsOfTeamUseCase{
  GetAllWorkoutsOfTeamUseCase(this._iGetAllWorkoutsOfTeamRepository);
  IGetAllWorkoutsOfTeamRepository _iGetAllWorkoutsOfTeamRepository;
  Future<ReturnData<List<WorkoutEntity>>> call() async{
    return await _iGetAllWorkoutsOfTeamRepository();
  }
}