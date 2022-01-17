import '/app/modules/athlete_profile/domain/entities/data_point_of_%20athlete_historic_entity.dart';
import '/app/modules/athlete_profile/domain/entities/value_data_point_of_athlete_historic_entity.dart';

class DataPointOfAthleteHistoricDTO extends DataPointOfAthleteHistoricEntity{
  int? id;
  String? date;
  List<ValueDataPointOfAthleteHistoricEntity>? values;

  DataPointOfAthleteHistoricDTO({this.id, this.date, this.values}):super(id: id, date: date, values: values);

  DataPointOfAthleteHistoricDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['createdAt'];
    if (json['values_data_point'] != null) {
      values = <Values>[];
      json['values_data_point'].forEach((v) {
        values?.add(new Values.fromJson(v));
      });
    }
  }

  List<Map<String, dynamic>>? toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.values != null) {
     return this.values?.map((item) => Values(id: item.id, type: item.type, value: item.value).toJson()).toList();
    }
    return [];
  }
}

class Values extends ValueDataPointOfAthleteHistoricEntity{
  int? id;
  String? type;
  String? value;

  Values({this.id, this.type, this.value}):super(id: id, type: type, value: value);

  Values.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['value'] = this.value;
    return data;
  }
}