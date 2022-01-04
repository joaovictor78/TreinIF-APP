import 'package:treinif/app/core/utils/return_data.dart';
import 'package:treinif/app/modules/start/submodules/home/domain/entities/athletes_entity.dart';

import '/app/modules/start/submodules/workouts/domain/i_repositories/i_get_all_athletes_by_individual_workouts_repository.dart';

class GetAllAthletesByIndividualWorkoutsUseCase{
  GetAllAthletesByIndividualWorkoutsUseCase(this.getAllAthletesByIndividualWorkoutsRepository);
  final IGetAllAthletesByIndividualWorkoutsRepository getAllAthletesByIndividualWorkoutsRepository;
  Future<ReturnData<List<AthleteEntity>>> call() async{
    final _response = await getAllAthletesByIndividualWorkoutsRepository();
    return _response;
  }
}