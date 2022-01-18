import '/app/core/utils/return_data.dart';

abstract class IAddIndividualWorkoutDataSource{
  Future<ReturnData> call();
}