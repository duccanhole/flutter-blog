class IUser{
  final String userName;
  final String password;
  IUser(  {required this.userName,required this.password});
  factory IUser.fromJson(Map<String, dynamic> json) {
    return IUser(
      userName: json['userName'],
      password: json['password'],
    );
  }
}