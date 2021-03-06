import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/modality_entity.dart';

abstract class IGetAllModalitiesDataSource{
  Future<ReturnData<List<ModalityEntity>>> call();
}