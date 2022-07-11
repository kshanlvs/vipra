abstract class Validator {
  String? validate(String? val);
}

class PasswordValidator implements Validator {
  static const String _pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  final RegExp _regExp = RegExp(_pattern);

  @override
  String? validate(String? val) {

    if(val!=null && val.isNotEmpty) {
       final isValidPass = _regExp.hasMatch(val);
    return isValidPass
        ? null
        : 'Password Should contain at least one upper case \n Should contain at least one lower case \n Should contain at least one digit \n Should contain at least one Special character \n Must be at least 8 characters in length ';
  
    }
    else if(val?.isEmpty == true) {
      return "This field cannot be empty";
    }
    else {
      return null;
    }
  }
}

class EmailValidator extends Validator {
  final String? errorMessage;
  EmailValidator({this.errorMessage});
  static const String _pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final RegExp _regExp = RegExp(_pattern);

  @override
  String? validate(String? val) {
    if (val != null && val.isNotEmpty) {
      final isValidEmail = _regExp.hasMatch(val);
      return isValidEmail ? null : (errorMessage ?? 'Enter a valid email ID');
    } else if (val?.isEmpty == true) {
      return "This field cannot be empty";
    }
    else {
      return null;
    }
  }
}

class EmptyValidator extends Validator {
  final String errorMsg;

  EmptyValidator({this.errorMsg = "This field cannot be empty"});
  @override
  String? validate(String? val) {
    if (val != null && val.isNotEmpty) {
      return null;
    }

    return errorMsg;
  }
}
