import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/home/domain/entities/athletes_entity.dart';

abstract class IGetAllAthletesByIndividualWorkoutsRepository{
  Future<ReturnData<List<AthleteEntity>>> call();
}