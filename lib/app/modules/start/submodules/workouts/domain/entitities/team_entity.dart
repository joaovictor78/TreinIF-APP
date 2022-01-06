import '/app/modules/start/submodules/workouts/domain/entitities/modality_entity.dart';

class TeamEntity {
  int? id; 
  String? name;
  String? description;
  String? code;
  ModalityEntity? modality; 
  int? workoutId;
  TeamEntity({
     this.id,
     this.name,
     this.description,
     this.code,
     this.workoutId,
     this.modality,
  });
}
