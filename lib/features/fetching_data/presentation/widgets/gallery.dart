// import 'package:flutter/material.dart';
// import 'package:flutter_sizer/flutter_sizer.dart';
// import 'package:remote_kitchen_technical_assignment/features/fetching_data/data/getGalleryData.dart';
// import 'package:remote_kitchen_technical_assignment/features/fetching_data/model/galleryModel.dart';

// class Gallery extends StatelessWidget {
//   const Gallery({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Future<List<GalleryModel>> data = GetGalleryData();
//     return FutureBuilder(
//         future: data,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasData) {
//             final galleryData = snapshot.data!;
//             return Padding(
//               padding: EdgeInsets.only(top: 0, left: 4.w, right: 10),
//               child: ListView.builder(
//                   itemCount: galleryData.length,
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         // Navigator.push(context,
//                         //     MaterialPageRoute(builder: (context)  {
//                         //   // return ImageDetails(id: galleryData[index].id!, title: galleryData[index].title!, image: galleryData[index].url!  ,);
//                         // }));
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                             // border: Border.all(color: Colors.black)
//                             ),
//                         width: 100.w,
//                         height: 12.h,
//                         child: Row(
//                           children: <Widget>[
//                             Container(
//                               width: 20.w,
//                               height: 20.h,
//                               decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                 image: NetworkImage(galleryData[index].url!),
//                               )),
//                             ),
//                             SizedBox(
//                               width: 5.w,
//                             ),
//                             Flexible(
//                                 child: Text(galleryData[index].title!,
//                                     style: TextStyle(
//                                         fontSize: 5.w,
//                                         fontWeight: FontWeight.w700)))
//                           ],
//                         ),
//                         // trailing: Text(galleryData[index].id.toString()),
//                       ),
//                     );
//                   }),
//             );
//           } else {
//             return const Text('Sorry, No data available !');
//           }
//         });
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:remote_kitchen_technical_assignment/features/fetching_data/data/gallery_controller.dart';
import 'package:remote_kitchen_technical_assignment/features/fetching_data/model/galleryModel.dart';

class Gallery extends StatelessWidget {
  
  const Gallery({super.key});

  @override
  Widget build(BuildContext context) {
  final GalleryController galleryController = Get.put(GalleryController());
  final galleryData = galleryController.galleryData.value;
    return Container(
      child: Obx(() {
        if (galleryController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return  ListView.builder(
               itemCount: galleryController.galleryData.length,
               itemBuilder: (context, index) {
                 return GestureDetector(
                   onTap: () {
                     // Navigator.push(context,
                     //     MaterialPageRoute(builder: (context)  {
                     //   // return ImageDetails(id: galleryData[index].id!, title: galleryData[index].title!, image: galleryData[index].url!  ,);
                     // }));
                   },
                   child: Container(
                     decoration: BoxDecoration(
                         // border: Border.all(color: Colors.black)
                         ),
                     width: 100.w,
                     height: 12.h,
                     child: Row(
                       children: <Widget>[
                         Container(
                           width: 20.w,
                           height: 20.h,
                           decoration: BoxDecoration(
                               image: DecorationImage(
                             image: NetworkImage(galleryData[index].url!),
                           )),
                         ),
                         SizedBox(
                           width: 5.w,
                         ),
                         Flexible(
                             child: Text(galleryData[index].title!,
                                 style: TextStyle(
                                     fontSize: 5.w,
                                     fontWeight: FontWeight.w700)))
                       ],
                     ),
                     // trailing: Text(galleryData[index].id.toString()),
                   ),
                 );
        });
      }
    }),
      
    );
  }
}