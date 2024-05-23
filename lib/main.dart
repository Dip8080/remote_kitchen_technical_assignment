import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:remote_kitchen_technical_assignment/features/Home/presentation/screens/Home.dart';
import 'package:remote_kitchen_technical_assignment/features/fetching_data/model/galleryModel.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(GalleryModelAdapter());
  await Hive.openBox<GalleryModel>('gallery');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSizer(builder: (context , orientation , screenType) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Remote Kitchen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
    });
    
  }
}

