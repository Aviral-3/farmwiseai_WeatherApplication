import 'package:flutter/material.dart';
import '../models/farmer.dart';
import '../services/location_service.dart';
import '../widgets/image_video_capture.dart';
import 'package:image_picker/image_picker.dart';
import 'gallery_screen.dart'; // Import your gallery screen
import '../LocationService.dart';

class DataCollectionScreen extends StatefulWidget {
  @override
  _DataCollectionScreenState createState() => _DataCollectionScreenState();
}

class _DataCollectionScreenState extends State<DataCollectionScreen> {
  List<Farmer> farmers = []; // List to store submitted data
  String _latitude = '';
  String _longitude = '';

  void _submitData() async {
   try{
     final location = await LocationService.getCurrentLocation(); // Assuming this method exists
     final imagePath = await captureImage();
     final videoPath = await captureVideo();

     final newFarmer = Farmer(
       name: 'Name', // Add actual data collection logic
       dob: DateTime.now(), // Placeholder, replace with actual data
       gender: 'Gender', // Placeholder, replace with actual data
       landArea: 10.0, // Placeholder, replace with actual data
       latitude: location.latitude,
       longitude: location.longitude,
       imagePath: imagePath,
       videoPath: videoPath,
     );

     setState(() {
       farmers.add(newFarmer);
       _latitude = location.latitude.toString();
       _longitude = location.longitude.toString();
     });
   }catch(e){
     print('An error occurred while getting location: $e');
   }



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data Collection')),
      body: Column(
        children: <Widget>[
          // Your data collection widgets here
          ElevatedButton(
            onPressed: _submitData,
            child: Text('Submit Data'),
          ),
          Text('Latitude: $_latitude'),
          Text('Longitude: $_longitude'),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GalleryScreen(farmers: farmers)),
              );
            },
            child: Text('View Gallery'),
          ),
        ],
      ),
    );
  }

  Future<String> captureImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    return image?.path ?? ''; // Handle the null case as required
  }

  Future<String> captureVideo() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? video = await _picker.pickVideo(source: ImageSource.camera);
    return video?.path ?? ''; // Handle the null case as required
  }
}

