import '/app/core/network/interfaces/i_http_client.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/data/repositories/i_datasources/i_add_individual_workout_datasource.dart';

class AddIndividualWorkoutDataSource implements IAddIndividualWorkoutDataSource{
  IHttpClient _client;
  AddIndividualWorkoutDataSource(this._client);
  @override
  Future<ReturnData> call() async {
    try{
      await _client.post("");
      return ReturnData(true);
    } catch(error){
      return ReturnData(false);
    }
  }

}