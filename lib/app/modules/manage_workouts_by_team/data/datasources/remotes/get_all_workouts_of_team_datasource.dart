import '/app/core/network/interfaces/i_http_client.dart';
import '/app/domain/entitities/workout_entity.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_workouts_by_team/data/repositories/i_datasources/i_get_all_workouts_of_team_datasource.dart';

class GetAllWorkoutsOfTeamDataSource implements IGetAllWorkoutsOfTeamDataSource{
  GetAllWorkoutsOfTeamDataSource(this._client);
  IHttpClient _client;
  @override
  Future<ReturnData<List<WorkoutEntity>>> call() async {
    return await _client.get("");
  }
}