import 'package:treinif/app/domain/entitities/exercise_type_entity.dart';

import '/app/core/network/interfaces/i_http_client.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_exercicies_types/data/repositories/i_datasources/i_add_exercise_type_datasource.dart';

class AddExerciseTypeDataSource implements IAddExerciseTypeDataSource{
  final IHttpClient _client;
  AddExerciseTypeDataSource(this._client);
  @override
  Future<ReturnData<ExerciseTypeEntity>> call() async {
    try{
      await _client.post("");
      return ReturnData(true);
    }catch(error){
      return ReturnData(false);
    }
  }
}