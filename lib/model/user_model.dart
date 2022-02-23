class UserModel {
  String? uid;
  String? email;
  String? name;
  String? cellNo;
  String? telNo;
  String? faxNo;
  String? time;

  UserModel({
    this.uid,
    this.email,
    this.name,
    this.cellNo,
    this.telNo,
    this.faxNo,
    this.time,
  });

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      cellNo: map['cellNo'],
      telNo: map['telNo'],
      faxNo: map['faxNo'],
      time: map['time'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'cellNo': cellNo,
      'telNo': telNo,
      'faxNo': faxNo,
      'time': time,
    };
  }
}
