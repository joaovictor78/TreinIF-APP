class AthleteDTO {
  int? athleteId;
  String? fullName;
  String? email;
  String? avatarUrl;
  String? birthDate;
  String? bloodType;
  String? cPF;
  String? rG;

  AthleteDTO(
      {this.athleteId,
      this.fullName,
      this.email,
      this.avatarUrl,
      this.birthDate,
      this.bloodType,
      this.cPF,
      this.rG});

  AthleteDTO.fromJson(Map<String, dynamic> json) {
    athleteId = json['athlete_id'];
    fullName = json['full_name'];
    email = json['email'];
    avatarUrl = json['avatar_url'];
    birthDate = json['birth_date'];
    bloodType = json['blood_type'];
    cPF = json['CPF'];
    rG = json['RG'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['athlete_id'] = this.athleteId;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['avatar_url'] = this.avatarUrl;
    data['birth_date'] = this.birthDate;
    data['blood_type'] = this.bloodType;
    data['CPF'] = this.cPF;
    data['RG'] = this.rG;
    return data;
  }
}