import 'package:flutter/material.dart';
import 'data_collection_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farmers App'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Collect Farmer Data'),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DataCollectionScreen()),
            );
          },
        ),
      ),
    );
  }
}
