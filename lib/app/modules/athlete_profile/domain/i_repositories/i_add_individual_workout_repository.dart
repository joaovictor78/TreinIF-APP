import 'package:treinif/app/core/utils/return_data.dart';

abstract class IAddIndividualWorkoutRepository{
  Future<ReturnData> call();
}