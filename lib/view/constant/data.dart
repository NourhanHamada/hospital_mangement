import 'package:flutter_pw_validator/Resource/Strings.dart';

String? currentLangCode;



//validations
String validationEmail =
    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
String validationPassword =
    r'(?=[A-Za-z0-9@#$%^&+!=]+$)^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@#$%^&+!=])(?=.{8,}).*$';
String validatePasswordUpperCase = r'[A-Z]';
String validatePasswordLowerCase = r'[a-z]';
String validatePasswordDigits = r'[0-9]';
String validatePasswordSpecialChar = r'[!@#$%^&*(),.?":{}|<>]';
String validationName = r'^[a-z A-Z]+$';
String validationPhone = r'(^(?:[+0]9)?[0-9]{10,12}$)';

// Password valid Class
class PasswordValidPlugin extends FlutterPwValidatorStrings {
  @override
  final String atLeast = '8 Characters minimum';
  @override
  final String uppercaseLetters = 'One uppercase character';
  @override
  final String specialCharacters = 'One special character';
  @override
  final String lowercaseLetters = "One lowercase character";
}

// Cache Keys
String firstNameKey = 'firstName';
String lastNameKey = 'lastName';
String genderKey = 'gender';
String specialistKey = 'specialist';
String dateOfBirthKey = 'dateOfBirth';
String statusKey = 'status';
String phoneNumberKey = 'phoneNumber';
String emailKey = 'email';
String addressKey = 'address';
String passwordKey = 'password';
String accessTokenKey = 'accessToken';

// User Data
String userFirstName = '';
String userLastName = '';
String userGender = '';
String userSpecialist = '';
String userDateOfBirth = '';
String userStatus = '';
String userPhoneNumber = '';
String userEmail = '';
String userAddress = '';
String userPassword = '';
String userAccessToken = '';