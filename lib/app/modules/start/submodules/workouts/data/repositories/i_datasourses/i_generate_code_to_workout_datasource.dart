import 'package:treinif/app/core/utils/return_data.dart';
import 'package:treinif/app/modules/start/submodules/workouts/domain/entitities/code_entitiy.dart';

abstract class IGenerateCodeToWorkoutDataSource{
  Future<ReturnData<CodeEntity>> call();
}