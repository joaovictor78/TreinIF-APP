import '/app/modules/start/submodules/workouts/domain/entitities/modality_entity.dart';

class TeamEntity {
  int id; 
  String name;
  String description;
  String code;
  ModalityEntity modality; 
  TeamEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.code,
    required this.modality,
  });
}
