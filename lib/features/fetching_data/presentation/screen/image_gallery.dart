import 'package:flutter/material.dart';
import 'package:remote_kitchen_technical_assignment/features/fetching_data/presentation/widgets/gallery.dart';

class ImageGallery extends StatelessWidget {
  const ImageGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Gallery'),
      ),
      body: const Center(
        child: Gallery(), // Replace with your content            
      ),
    );
  }
}