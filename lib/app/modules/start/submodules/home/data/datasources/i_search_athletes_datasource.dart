import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/home/domain/entities/athletes_entity.dart';

abstract class ISearchAthletesDataSource{
  Future<ReturnData<List<AthleteEntity>>> call({required int limit, required int page, required String searchTerm});
}