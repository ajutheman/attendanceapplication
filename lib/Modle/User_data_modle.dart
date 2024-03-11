class UserDataModel {
  late final String id;
  late final String name;
  String imageUrl;
  String status;
  late final String pin;
  int? workingDays;
  late final String contactInformation; // Updated naming convention
  late final String officeTiming; // Updated naming convention
  late final String designation;
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
