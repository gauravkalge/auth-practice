class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? cellNo;
  String? telNo;
  String? faxNo;
  String? time;

  UserModel(
      {this.uid,
      this.email,
      this.firstName,
      this.cellNo,
      this.telNo,
      this.faxNo,
      this.time,
      });

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
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
      'firstName': firstName,
      'cellNo': cellNo,
      'telNo': telNo,
      'faxNo': faxNo,
      'time' : time,
    };
  }
}
