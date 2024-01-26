// import 'dart:io';
// import 'package:flutter/material.dart';
// import '../models/farmer.dart'; // Make sure this path is correct
//
// class GalleryScreen extends StatelessWidget {
//   final List<Farmer> farmers;
//
//   GalleryScreen({required this.farmers});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Farmers Gallery'),
//       ),
//       body: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         itemCount: farmers.length,
//         itemBuilder: (context, index) {
//           return Card(
//             child: Column(
//               children: <Widget>[
//                 Expanded(
//                   child: Image.file(
//                     File(farmers[index].imagePath), // Ensure this is a valid path
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) {
//                       return Center(child: Text('Image not available'));
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(farmers[index].name),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import '../models/farmer.dart';


class GalleryScreen extends StatelessWidget {
  final List<Farmer> farmers;

  GalleryScreen({required this.farmers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gallery')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: farmers.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: <Widget>[
                Image.file(File(farmers[index].imagePath)), // Display image
                Text(farmers[index].name),
                Text('Latitude: ${farmers[index].latitude}'),
                Text('Longitude: ${farmers[index].longitude}'),
                // Add other details you want to display
              ],
            ),
          );
        },
      ),
    );
  }
}

