// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:photo_view/photo_view_gallery.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:the_paper_boutique/constants/app_color.dart';
// import 'package:the_paper_boutique/constants/constant.dart';
// import 'package:the_paper_boutique/screens/product_detail/models/product_data.dart';
// import 'package:the_paper_boutique/widget/custom_container.dart';
// import 'package:the_paper_boutique/widget/custom_image_view.dart';
// import 'package:the_paper_boutique/widget/custom_page_route.dart';

// class CourosolSlider extends StatefulWidget {
//   final List<Images> imgList;
//   const CourosolSlider({super.key, required this.imgList});
//   @override
//   State<StatefulWidget> createState() => _CourosolSliderState();
// }

// class _CourosolSliderState extends State<CourosolSlider> {
//   int _current = 0;
//   // final CarouselController _controller = CarouselController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           CarouselSlider(
//             options: CarouselOptions(
//                 viewportFraction: 1,
//                 onPageChanged: (index, reason) {
//                   setState(() {
//                     _current = index;
//                   });
//                 },
//                 aspectRatio: 2.0),
//             items: widget.imgList
//                 .map((item) => Center(
//                         child: GestureDetector(
//                       onTap: () {
//                         // navigate.
//                         //navigatorPush(context, photoView(url: item.src));
//                         Navigator.push(
//                             context,
//                             CustomPageRoute(
//                                 builder: (_) => PhotoViewDemo(
//                                       imgList: widget.imgList,initialPage: _current,
//                                     )));
//                       },
//                       child: CustomImageView(
//                         width: double.infinity,

//                         cornerRadius: 0.0,
//                         height: 60.w,
//                         url: item.src ?? photoUrl,
//                         fit: BoxFit.fitHeight,
//                         // width: 100.w,
//                         fallBackText: item.src ?? photoUrl,
//                       ),
//                     )))
//                 .toList(),
//           ),
//           Positioned(
//             right: 0.0,
//             left: 0.0,
//             bottom: 3.0,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: widget.imgList.asMap().entries.map((entry) {
//                 return GestureDetector(

//                     //  onTap: () => _controller.animateToPage(entry.key),
//                     child: Container(
//                         width: 10.0,
//                         height: 10.0,
//                         margin: const EdgeInsets.symmetric(
//                             vertical: 8.0, horizontal: 4.0),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: _current == entry.key
//                               ? colorPrimary
//                               : secondaryColor,
//                         )));
//               }).toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ignore: must_be_immutable
// class photoView extends StatelessWidget {
//   var url;
//   photoView({required this.url});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PhotoView(
//         imageProvider: CachedNetworkImageProvider(url),
//       ),
//     );
//   }
// }

// // ignore: must_be_immutable
// class PhotoViewDemo extends StatefulWidget {
//   final List<Images> imgList;
//   int initialPage;
//   PhotoViewDemo({required this.imgList, required this.initialPage});
//   @override
//   _PhotoViewDemoState createState() => _PhotoViewDemoState();
// }

// class _PhotoViewDemoState extends State<PhotoViewDemo> {
//   late PageController _pageController;
//   @override
//   void initState() {
//     _pageController = PageController(initialPage: widget.initialPage);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: black,
//       body: Stack(
//         children: [
//           Container(
//             color: black,
//             height: double.infinity,
//             width: double.infinity,
//             child: PhotoViewGallery.builder(
//               pageController: _pageController,
//               itemCount: widget.imgList.length,
//               builder: (context, index) {
//                 return PhotoViewGalleryPageOptions(
//                   // disableGestures: true,

//                   imageProvider: CachedNetworkImageProvider(
//                       widget.imgList[index].src ?? ""),
//                   minScale: PhotoViewComputedScale.contained * 0.8,
//                   maxScale: PhotoViewComputedScale.covered * 2,
//                 );
//               },
//               scrollPhysics: BouncingScrollPhysics(),
//               backgroundDecoration: BoxDecoration(
//                   //   borderRadius: BorderRadius.all(Radius.circular(20)),
//                   color: black),
//               loadingBuilder: (context, event) => Center(
//                 child: Container(
//                   width: 30.0,
//                   height: 30.0,
//                   child: CircularProgressIndicator(
//                       // backgroundColor: Colors.orange,
//                       // value: event == null
//                       //     ? 0
//                       //     : event.cumulativeBytesLoaded / event.expectedTotalBytes,
//                       ),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
//             child: CustomContainer(
//               onClick: () {
//                 Navigator.pop(context);
//               },
//               horizontalPadding: 0.0,
//               verticalPadding: 0.0,
//               radius: 40.0,
//               height: 40.0,
//               width: 40.0,
//               child: Icon(Icons.arrow_back_ios_new),
//             ),

//           ),
//   Positioned(right: 0.0,bottom: 0.0,top: 0.0,
//    child: Icon(Icons.arrow_forward_ios,color: white,size: 40.0),
//  ),
//   Positioned(left: 0.0,bottom: 0.0,top: 0.0,
//    child: Icon(Icons.arrow_back_ios_new,color: white,size: 40.0),
//  )

//         ],
//       ),
//     );
//   }
// }
