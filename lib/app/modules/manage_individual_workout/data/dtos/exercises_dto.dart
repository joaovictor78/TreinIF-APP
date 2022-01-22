import '/app/domain/entitities/exercise_entity.dart';
import '/app/domain/entitities/exercise_type_entity.dart';

class ExercisesDTO {
  List<ExerciseDTO>? exercises;

  ExercisesDTO({this.exercises});

  ExercisesDTO.fromJson(Map<String, dynamic> json) {
    if (json['exercises'] != null) {
      exercises = <ExerciseDTO>[];
      json['exercises'].forEach((v) {
        exercises!.add(new ExerciseDTO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.exercises != null) {
      data['exercises'] = this.exercises!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExerciseDTO extends ExerciseEntity {
  int? id;
  int? seriesNumber;
  int? repeatTimeInSeconds;
  String? exerciseVariation;
  ExerciseTypeEntity? exerciseType;
  ExercisesDaysOfWeek? exercisesDaysOfWeek;

  ExerciseDTO(
      {this.id,
      this.seriesNumber,
      this.repeatTimeInSeconds,
      this.exerciseVariation,
      this.exerciseType,
      this.exercisesDaysOfWeek}): super(id: id, seriesNumber: seriesNumber, exerciseType: exerciseType, exerciseVariation: exerciseVariation, repeatTimeInSeconds: repeatTimeInSeconds);

  ExerciseDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seriesNumber = json['series_number'];
    repeatTimeInSeconds = json['repeat_time_in_seconds'];
    exerciseVariation = json['exercise_variation'];
    exerciseType = json['exercise'] != null
        ? new ExerciseTypeDTO.fromJson(json['exercise'])
        : null;
    exercisesDaysOfWeek = json['exercises_days_of_week'] != null
        ? new ExercisesDaysOfWeek.fromJson(json['exercises_days_of_week'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['series_number'] = this.seriesNumber;
    data['repeat_time_in_seconds'] = this.repeatTimeInSeconds;
    data['exercise_variation'] = this.exerciseVariation;
    if (this.exerciseType != null) {
      data['exercise'] = ExerciseTypeDTO(id: exerciseType!.id, name: exerciseType!.name).toJson();
    }
    if (this.exercisesDaysOfWeek != null) {
      data['exercises_days_of_week'] = this.exercisesDaysOfWeek!.toJson();
    }
    return data;
  }
}

class ExerciseTypeDTO extends ExerciseTypeEntity{
  int? id;
  String? name;

  ExerciseTypeDTO({this.id, this.name}): super(id: id, name: name);

  ExerciseTypeDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class ExercisesDaysOfWeek {
  String? createdAt;
  String? updatedAt;
  int? dayOfWeekId;
  int? exerciseId;

  ExercisesDaysOfWeek(
      {this.createdAt, this.updatedAt, this.dayOfWeekId, this.exerciseId});

  ExercisesDaysOfWeek.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    dayOfWeekId = json['day_of_week_id'];
    exerciseId = json['exercise_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['day_of_week_id'] = this.dayOfWeekId;
    data['exercise_id'] = this.exerciseId;
    return data;
  }
}
