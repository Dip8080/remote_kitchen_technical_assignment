import 'package:flutter/material.dart';
import 'package:remote_kitchen_technical_assignment/features/Home/presentation/screens/showMessageScreen.dart';
import 'package:remote_kitchen_technical_assignment/features/counter_getx/presentation/screen/counter.dart';
import 'package:remote_kitchen_technical_assignment/features/fetching_data/presentation/screen/image_gallery.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remote Kitchen'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShowMessage()));
              },
              child: Text('Click to Navigate'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Counter()));
            },
            child: Text(' Counter with GetX'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ImageGallery()));
            },
            child: Text('Rest API with GetX'),
          ),
        ],
      ),
    );
  }
}
