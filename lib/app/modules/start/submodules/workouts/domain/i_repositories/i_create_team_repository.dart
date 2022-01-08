import 'package:treinif/app/core/utils/return_data.dart';
import 'package:treinif/app/modules/start/submodules/workouts/domain/entitities/team_entity.dart';

abstract class ICreateTeamRepository{
  Future<ReturnData> call(TeamEntity team);
}