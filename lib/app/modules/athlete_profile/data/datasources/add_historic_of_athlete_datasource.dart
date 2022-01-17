import '/app/modules/athlete_profile/data/dtos/data_point_of_athlete_historic_dto.dart';
import '/app/modules/athlete_profile/domain/entities/data_point_of_%20athlete_historic_entity.dart';
import '/app/core/network/interfaces/i_http_client.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/data/repositories/i_datasources/i_add_historic_of_athlete_datasource.dart';

class AddHistoricOfAthleteDataSource implements IAddHistoricOfAthleteDataSource{
  AddHistoricOfAthleteDataSource(this._client);
  IHttpClient _client;
  @override
  Future<ReturnData> call(int athleteID, DataPointOfAthleteHistoricEntity dataPoint) async{
    try{
      DataPointOfAthleteHistoricDTO _dataPointDTO = DataPointOfAthleteHistoricDTO(id: dataPoint.id, values: dataPoint.values);
      await _client.post("/athletes/$athleteID/historic", data: _dataPointDTO.toJson());
      return ReturnData(true);
    } catch(error){
      return ReturnData(false);
    }
  }

}