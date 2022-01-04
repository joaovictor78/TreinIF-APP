import '/app/modules/start/submodules/workouts/domain/entitities/course_entity.dart';

import '/app/modules/start/submodules/workouts/domain/entitities/modality_entity.dart';

class AthleteEntity {
  String? id;
  String? name;
  String? avatarUrl;
  String? teamName;
  String? cpf;
  String? rg;
  String? courseName;
  ModalityEntity? modality;
  CourseEntity? course;
}
