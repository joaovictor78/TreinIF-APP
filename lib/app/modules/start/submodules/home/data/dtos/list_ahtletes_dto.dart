import 'package:treinif/app/modules/start/submodules/home/data/dtos/athlete_dto.dart';

class ListAthletesDTO {
  int? size;
  List<AthleteDTO>? athletes;

  ListAthletesDTO({this.size, this.athletes});

  ListAthletesDTO.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    if (json['athletes'] != null) {
      athletes = <AthleteDTO>[];
      json['athletes'].forEach((v) {
        athletes!.add(new AthleteDTO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['size'] = this.size;
    if (this.athletes != null) {
      data['athletes'] = this.athletes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}