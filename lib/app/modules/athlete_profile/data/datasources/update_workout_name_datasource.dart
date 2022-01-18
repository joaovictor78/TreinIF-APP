import '/app/core/network/interfaces/i_http_client.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/data/repositories/i_datasources/i_update_workout_name_datasource.dart';

class UpdateWorkoutNameDataSource implements IUpdateWorkoutNameDataSource{
  IHttpClient _client;
  UpdateWorkoutNameDataSource(this._client);
  @override
  Future<ReturnData> call(int workoutID, String name) async {
    return await _client.put("/individual/workouts/$workoutID", data: { "name" : name });
  }
}