class UserDataModel {
  final String id;
  final String name;
  String imageUrl;
  String status;
  final String pin;
  int? workingDays;
  final String contactInformation; // Updated naming convention
  final String officeTiming; // Updated naming convention
  final String designation;
  UserDataModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.pin,
    required this.designation,
    this.status = 'Absent',
    this.workingDays,
    required this.contactInformation, // Updated naming convention
    required this.officeTiming, // Updated naming convention
  });
}
