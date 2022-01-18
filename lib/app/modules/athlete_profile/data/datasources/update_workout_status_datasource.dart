import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/data/repositories/i_datasources/i_update_workout_status_datasource.dart';

import '/app/core/network/interfaces/i_http_client.dart';

class UpdateWorkoutStatusDataSource implements IUpdateWorkoutStatusDataSource{
  IHttpClient _client;
  UpdateWorkoutStatusDataSource(this._client);

  @override
  Future<ReturnData> call(workoutID) async {
     try{
       await _client.put("/individual/workouts/$workoutID/activate");
       return ReturnData(true);
     } catch(error){
       return ReturnData(false);
     }
  }

}