class Farmer {
  String name;
  String address;
  DateTime dob;
  String gender;
  double landArea;
  double latitude;
  double longitude;
  String imagePath;
  String videoPath;

  Farmer({
    required this.name,
    this.address = '',
    required this.dob,
    required this.gender,
    required this.landArea,
    required this.latitude,
    required this.longitude,
    required this.imagePath,
    required this.videoPath,
  });

// Serialization/deserialization methods
}
