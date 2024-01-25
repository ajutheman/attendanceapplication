enum UserType { admin, masters, employe }

class User {
  final String username;
  final String password;
  final UserType userType;
  // Add any additional properties based on your requirements

  User({
    required this.username,
    required this.password,
    required this.userType,
    // Add additional parameters here
  });
}
