class Student {
  String? numberID;
  String? accountID;
  Null? imageUrl;
  String? fullName;
  String? birthDay;
  String? gender;
  String? dateCreated;
  String? phoneNumber;
  bool? locked;
  String? password;
  bool? active;
  String? schoolYear;
  String? schoolKey;

  Student(
      {this.numberID,
      this.accountID,
      this.imageUrl,
      this.fullName,
      this.birthDay,
      this.gender,
      this.dateCreated,
      this.phoneNumber,
      this.locked,
      this.password,
      this.active,
      this.schoolYear,
      this.schoolKey});

  Student.fromJson(Map<String, dynamic> json) {
    numberID = json['numberID'];
    accountID = json['accountID'];
    imageUrl = json['imageUrl'];
    fullName = json['fullName'];
    birthDay = json['birthDay'];
    gender = json['gender'];
    dateCreated = json['dateCreated'];
    phoneNumber = json['phoneNumber'];
    locked = json['locked'];
    password = json['password'];
    active = json['active'];
    schoolYear = json['schoolYear'];
    schoolKey = json['schoolKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numberID'] = this.numberID;
    data['accountID'] = this.accountID;
    data['imageUrl'] = this.imageUrl;
    data['fullName'] = this.fullName;
    data['birthDay'] = this.birthDay;
    data['gender'] = this.gender;
    data['dateCreated'] = this.dateCreated;
    data['phoneNumber'] = this.phoneNumber;
    data['locked'] = this.locked;
    data['password'] = this.password;
    data['active'] = this.active;
    data['schoolYear'] = this.schoolYear;
    data['schoolKey'] = this.schoolKey;
    return data;
  }
}