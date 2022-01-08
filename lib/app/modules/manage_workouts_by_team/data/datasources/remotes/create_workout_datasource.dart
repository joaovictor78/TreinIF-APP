import '/app/modules/manage_workouts_by_team/data/dtos/workout_dto.dart';
import '/app/core/network/interfaces/i_http_client.dart';
import '/app/domain/entitities/workout_entity.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_workouts_by_team/data/repositories/i_datasources/i_create_workout_datasource.dart';

class CreateWorkoutDataSource implements ICreateWorkoutDataSource{
  CreateWorkoutDataSource(this._client);
  IHttpClient _client;
  @override
  Future<ReturnData<WorkoutEntity>> call(WorkoutEntity workout) async{
    try{
      final response = await _client.post("", data: WorkoutDTO());
      return ReturnData(true);
    }catch(error){
      return ReturnData(false);
    }
  }

}