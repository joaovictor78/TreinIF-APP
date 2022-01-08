import 'package:treinif/app/core/utils/return_data.dart';
import 'package:treinif/app/modules/start/submodules/workouts/domain/entitities/modality_entity.dart';

abstract class IGetAllModalitiesRepository{
  Future<ReturnData<List<ModalityEntity>>> call();
}