class IUser {
  final String userName;
  final String password;
  final String userId;
  IUser({required this.userName, this.password = '', this.userId = ''});
  factory IUser.fromJson(Map<String, dynamic> json) {
    return IUser(
        userName: json['userName'],
        password: json['password'] ?? "",
        userId: json['userId'] ?? "");
  }
}
