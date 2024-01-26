import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../utils/permissions.dart';
import 'dart:io';

class ImageVideoCapture extends StatefulWidget {
  @override
  _ImageVideoCaptureState createState() => _ImageVideoCaptureState();
}

class _ImageVideoCaptureState extends State<ImageVideoCapture> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  XFile? _videoFile;

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_imageFile != null) Image.file(File(_imageFile!.path)),
        ElevatedButton(
          onPressed: captureImage,
          child: Text('Capture Image'),
        ),
        if (_videoFile != null) Text('Video captured: ${_videoFile!.path}'),
        ElevatedButton(
          onPressed: captureVideo,
          child: Text('Capture Video'),
        ),
      ],
    );
  }


  static Future<bool> requestCameraPermission() async {
  var status = await Permission.camera.status;
  if (!status.isGranted) {
  status = await Permission.camera.request();
  }
  return status.isGranted;
  }
  }



