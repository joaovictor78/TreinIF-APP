import "/app/modules/athlete_profile/data/repositories/i_datasources/i_get_athlete's_history_datasource.dart";
import '/app/modules/athlete_profile/domain/entities/data_point_of_%20athlete_historic_entity.dart';
import '/app/core/utils/return_data.dart';
import "../../domain/i_repositories/i_get_athlete's_history_repository.dart";

class GetAthletesHistoryRepository implements IGetAthletesHistoryRepository{
  GetAthletesHistoryRepository(this._getAthletesHistoryDataSource);
  IGetAthletesHistoryDataSource _getAthletesHistoryDataSource;
  @override
  Future<ReturnData<List<DataPointOfAthleteHistoricEntity>>> call(int athleteID) async {
      return await _getAthletesHistoryDataSource(athleteID);
  }
}