import '/app/core/network/interfaces/i_http_client.dart';
import '/app/modules/start/submodules/home/domain/entities/athletes_entity.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/workouts/data/repositories/i_datasourses/i_get_all_athletes_by_individual_workouts_datasource.dart';

class GetAllAthletesByIndividualWorkoutsDataSource implements IGetAllAthletesByIndividualWorkoutsDataSource{
  GetAllAthletesByIndividualWorkoutsDataSource(this._client);
  final IHttpClient _client;
  @override
  Future<ReturnData<List<AthleteEntity>>> call() async {
    try{
      final response = await _client.get("/individual/workouts");
      return ReturnData(true);
    }catch(error){
      return ReturnData(false);
    }
  }

}