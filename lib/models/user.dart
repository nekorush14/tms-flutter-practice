class User {
  String _name = "";
  String _email = "";
  String _password = "";

  User(String name, String email, String password) {
    _name = name;
    _email = email;
    _password = password;
  }

  String get name => _name;
  String get email => _email;
  String get password => _password;
}
