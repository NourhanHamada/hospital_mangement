import '../user_model.dart';

class LoginModel {
  late String email, password;


  // String? type;
  // String? message;
  // String? accessToken;
 // print("data1");
  LoginModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json[password];
    // type = json['type'];
    // message = json['message'];
    // accessToken = json['token'];
    //data = LoginData.fromJson(json['user']);
    print("data");
  }
}
