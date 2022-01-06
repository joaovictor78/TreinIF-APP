import '/app/modules/start/submodules/home/domain/entities/athletes_entity.dart';
class AthleteDTO extends AthleteEntity{
  int? id;
  String? name;
  String? email;
  String? avatarUrl;
  int? roleId;
  String? birthDate;
  String? bloodType;
  String? cpf;
  String? rg;
  int? userId;

  AthleteDTO(
      {this.id,
      this.name,
      this.email,
      this.avatarUrl,
      this.roleId, 
      this.birthDate,
      this.bloodType,
      this.cpf,
      this.rg,
      this.userId}):super(name: name, email: email, birthday: birthDate, bloodType: bloodType, course: "", cpf: cpf, rg: rg);

  AthleteDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['full_name'];
    email = json['email'];
    avatarUrl = json['avatar_url'];
    roleId = json['role_id'];
    birthDate = json['birth_date'];
    bloodType = json['blood_type'];
    cpf = json['CPF'];
    rg = json['RG'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.name;
    data['email'] = this.email;
    data['avatar_url'] = this.avatarUrl;
    data['role_id'] = this.roleId;
    data['birth_date'] = this.birthDate;
    data['blood_type'] = this.bloodType;
    data['CPF'] = this.cpf;
    data['RG'] = this.rg;
    data['user_id'] = this.userId;
    return data;
  }
}