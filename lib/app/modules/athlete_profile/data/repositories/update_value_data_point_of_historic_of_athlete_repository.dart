import '/app/modules/athlete_profile/domain/entities/value_data_point_of_athlete_historic_entity.dart';
import '/app/modules/athlete_profile/data/repositories/i_datasources/i_update_value_data_point_historic_of_athlete_datasource.dart';
import '/app/core/utils/return_data.dart';

class UpdateValueDataPointOfHistoricOfAthleteRepository{
  IUpdateValueDataPointHistoricOfAthleteDataSource _iUpdateValueDataPointHistoricOfAthleteDataSource;
  UpdateValueDataPointOfHistoricOfAthleteRepository(this._iUpdateValueDataPointHistoricOfAthleteDataSource);
  Future<ReturnData> call(int athleteID, int dataPointID, int valueDataPointID, ValueDataPointOfAthleteHistoricEntity valueDataPoint) async {
    return await _iUpdateValueDataPointHistoricOfAthleteDataSource(athleteID, dataPointID, valueDataPointID, valueDataPoint);
  }
}