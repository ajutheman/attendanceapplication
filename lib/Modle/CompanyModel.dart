import 'package:hive/hive.dart';

// Generated part file

@HiveType(typeId: 0) // Unique typeId for this Hive object
class CompanyModel extends HiveObject {
  @HiveField(0)
  late String companyName;

  @HiveField(1)
  late String email;

  @HiveField(2)
  late String password;

  @HiveField(3)
  late int numberOfStaff;

  @HiveField(4)
  late int numberOfBranches;

  @HiveField(5)
  late String branchLocation;

  // Constructor
  CompanyModel({
    required this.companyName,
    required this.email,
    required this.password,
    required this.numberOfStaff,
    required this.numberOfBranches,
    required this.branchLocation,
  });
}
