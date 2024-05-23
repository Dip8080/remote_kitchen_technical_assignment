import 'package:flutter/material.dart';

class ShowMessage extends StatelessWidget {
  const ShowMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        leading: IconButton(onPressed: () { Navigator.pop(context);}, icon: Icon(Icons.arrow_back),
        ),
        title: Text('Show Message'),
        centerTitle: true,
      ),
      body: Center(
        
          child: Text('This is just a message', style: TextStyle(fontSize: 30),),
        
      ),
    );
   
  }
}