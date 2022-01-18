import '/app/modules/athlete_profile/domain/i_repositories/i_add_individual_workout_repository.dart';
import '/app/core/utils/return_data.dart';

class AddIndividualWorkoutUseCase{
  IAddIndividualWorkoutRepository _iAddIndividualWorkoutRepository;
  AddIndividualWorkoutUseCase(this._iAddIndividualWorkoutRepository);
  Future<ReturnData> call() async {
    return _iAddIndividualWorkoutRepository(); 
  }
}