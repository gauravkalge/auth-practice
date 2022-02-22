class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? cellNo;

  UserModel({this.uid, this.email, this.firstName, this.cellNo});

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      cellNo: map['cellNo'],
    );
  }

 
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'cellNo': cellNo,
    };
  }
}
