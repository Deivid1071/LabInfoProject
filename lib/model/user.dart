
class User {
  static int userId;
  static String name;

//  User({this.userId, this.token});

  User.fromJson(Map<String, dynamic> json) {
    print(json);
    userId = json['id'];
    name = json['name'];
  }
}


class UserResponse {
  final User result;
  final String error;

  UserResponse(this.result, this.error);

  UserResponse.fromJson(Map<String, dynamic> json)
      : result = User.fromJson(json),
        error = "";

  UserResponse.withError(String errorValue)
      : result = null,
        error = errorValue;
}

class UserRegisterResponse {
  final String result;
  final String error;

  UserRegisterResponse(this.result, this.error);


  UserRegisterResponse.fromJson(Map<String, dynamic> json)
      : result = json['resultado'],
        error = "";

  UserRegisterResponse.withError(String errorValue)
      : result = null,
        error = errorValue;
}