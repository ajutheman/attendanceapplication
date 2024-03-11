// utils.dart

class User {
  final String username;
  final String password;
  final String role;

  User({
    required this.username,
    required this.password,
    required this.role,
  });
}

class Company {
  final String companyName;
  final String email;
  final String phone;
  final String location;
  final int numberOfStaff;
  final List<String> branches;
  final String industry;
  final int pin;
  final List<User> users;

  Company({
    required this.companyName,
    required this.email,
    required this.phone,
    required this.location,
    required this.numberOfStaff,
    required this.branches,
    required this.industry,
    required this.pin,
    required this.users,
  });
}

// Global data
List<Company> companies = [
  Company(
    companyName: 'ABC Corporation',
    email: 'info@abccorp.com',
    phone: '+1234567890',
    location: '123 Main Street, City, Country',
    numberOfStaff: 50,
    branches: ['Branch A', 'Branch B', 'Branch C'],
    industry: 'Technology',
    pin: 123456,
    users: [
      User(username: 'admin', password: 'admin123', role: 'admin'),
    ],
  ),
];

List<User> users = [
  User(username: 'admin', password: 'admin123', role: 'admin'),
];
