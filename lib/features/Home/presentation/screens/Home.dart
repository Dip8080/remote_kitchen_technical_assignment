import 'package:flutter/material.dart';
import 'package:remote_kitchen_technical_assignment/features/Home/presentation/screens/showMessageScreen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remote Kitchen'),
        centerTitle: true,
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ShowMessage()));
          },
          child: Text('Click to Navigate'),
        )
      ),
    );
  }
}