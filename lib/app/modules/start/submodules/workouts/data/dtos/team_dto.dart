import 'dart:convert';

import '/app/modules/start/submodules/workouts/domain/entitities/modality_entity.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/team_entity.dart';

class TeamDTO extends TeamEntity {
  int? id;
  String? name;
  String? description;
  String? code;
  int? workoutId;
  ModalityEntity? modality;

  TeamDTO({this.id, this.name, this.description, this.modality, this.workoutId, this.code}): super(id: id!, name: name, description: description, code: code, modality: modality, workoutId: workoutId);


  factory TeamDTO.fromMap(Map<String, dynamic> map) {
    return TeamDTO(
      id: map['id']?.toInt(),
      name: map['name'],
      description: map['description'],
      workoutId: map['workout_id']?.toInt(),
      modality: map['modality'] != null ? ModalityEntity(name:  map['modality']) : null,
    );
  }

  factory TeamDTO.fromJson(String source) => TeamDTO.fromMap(json.decode(source));
}
