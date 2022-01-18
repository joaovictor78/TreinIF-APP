import '/app/domain/entitities/exercise_type_entity.dart';

class ExerciseEntity{
  int? id;
  int? seriesNumber;
  int? repeatTimeInSeconds;
  String? exerciseVariation;
  ExerciseTypeEntity? exerciseType; 
  ExerciseEntity({this.id, this.seriesNumber, this.exerciseType, this.exerciseVariation, this.repeatTimeInSeconds});
}