// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:jds_new/constants/app_color.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// // ignore: must_be_immutable
// class CustomCollapsableBar extends StatelessWidget {
//   final Widget? child;
//   final Function()? onBackClick;
//   final String? title;
//   final String? subTitle;
//   final Color? coloricon;
//   final Color? appBarColor;
//   final String? icon;
//   final bool isImg;
//   final Color? bgColor;
//   bool isOnline;
//   Widget? bottomWidget;
//   CustomCollapsableBar(
//       {super.key,
//       this.child,
//       this.subTitle,
//       this.title,
//       this.bgColor = white,
//       this.coloricon,
//       this.bottomWidget,
//       this.isOnline = false,
//       this.appBarColor,
//       this.isImg = false,
//       this.onBackClick,
//       this.icon});

//   @override
//   Widget build(BuildContext context) {
//     double expandedHeight = 3.h;

//     return CustomScrollView(
//       slivers: [
//         SliverAppBar(
//           elevation: 1.5,
//           pinned: true,
//           leading: Tooltip(
//             message: "Back",
//             child: IconButton(
//               onPressed: onBackClick,
//               icon: const Icon(
//                 Icons.arrow_back_ios,
//                 size: 18.0,
//                 color: Colors.black,
//               ),
//               color: white,
//             ),
//           ),
//           flexibleSpace: LayoutBuilder(builder: (context, constraints) {
//             final fraction =
//                 max(0, constraints.biggest.height - kToolbarHeight) /
//                     (expandedHeight - kToolbarHeight);
//             return FlexibleSpaceBar(
//               titlePadding:
//                   const EdgeInsetsDirectional.only(start: 40, bottom: 16),
//               title: Padding(
//                 padding: const EdgeInsets.only(right: 16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Padding(
//                         padding: EdgeInsets.only(
//                             left: 5 * (1 - fraction) > 0
//                                 ? 5 * (1 - fraction)
//                                 : 0),
//                         child: Text.rich(
//                           TextSpan(
//                               text: title ?? "",
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: subTitle != null ? 14 : 16),
//                               children: [
//                                 TextSpan(
//                                   text: subTitle != null ? '\n$subTitle ' : "",
//                                   style: const TextStyle(
//                                       color: Colors.black, fontSize: 10),
//                                 ),
//                               ]),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 18)
//                   ],
//                 ),
//               ),
//               background: icon != null && icon != ""
//                   ? Align(
//                       alignment: Alignment.bottomRight,
//                       child: Padding(
//                         padding: const EdgeInsets.all(20.0),
//                         child: CustomContainer(
//                             radius: 12.0,
//                             color: coloricon ?? colorPrimary,
//                             height: 15.w,
//                             width: 15.w,
//                             verticalPadding: 12.0,
//                             horizontalPadding: 2.0,
//                             child: isOnline
//                                 ? SizedBox(
//                                     child: isImg
//                                         ? CustomImageView(
//                                             url: icon ?? "",
//                                             fallBackText: "fallBackText")
//                                         : CustomSvgImageView(
//                                             url: icon ?? "",
//                                             fallBackText: "fallBackText"),
//                                   )
//                                 : SvgPicture.asset(
//                                     icon ?? "",
//                                     // ignore: deprecated_member_use
//                                     color: Colors.white,
//                                   )),
//                       ),
//                     )
//                   : null,
//             );
//           }),
//           bottom: MyWidget(
//             child: bottomWidget,
//             size: bottomWidget != null ? 50 : 0,
//           ),
//           expandedHeight: 13.h,
//           backgroundColor: bgColor ?? const Color(0xFFFFF4F4),
//         ),
//         // SliverPersistentHeader(
//         //   floating: false,
//         //   delegate: _SliverAppBarDelegateS(
//         //     sizedBox??SizedBox.shrink(),
//         //   ),
//         //   pinned: true,
//         // ),
//         SliverToBoxAdapter(
//             child: ConstrainedBox(
//           constraints: BoxConstraints(minHeight: 100.h - 79),
//           //   height: 1000,
//           child: Container(color: appBarColor ?? white, child: child),
//         ))
//       ],
//     );
//   }
// }

// // ignore: must_be_immutable

// class CustomCollapsableBarM extends StatelessWidget {
//   final Widget? child;
//   final Function()? onBackClick;
//   final String? title;
//   final Color? coloricon;
//   final Color? appBarColor;
//   final String? icon;
//   final Color? bgColor;
//   final ScrollPhysics? physics;
//   final ScrollController? controller;
//   const CustomCollapsableBarM(
//       {super.key,
//       this.child,
//       this.title,
//       this.bgColor,
//       this.coloricon,
//       this.appBarColor,
//       this.onBackClick,
//       this.controller,
//       this.physics,
//       this.icon});

//   @override
//   Widget build(BuildContext context) {
//     double expandedHeight = 3.h;
//     return Scaffold(
//       body: CustomScrollView(
//         physics: physics,
//         controller: controller,
//         slivers: [
//           SliverAppBar(
//               elevation: 1.5,
//               pinned: true,
//               flexibleSpace: LayoutBuilder(builder: (context, constraints) {
//                 final fraction =
//                     max(0, constraints.biggest.height - kToolbarHeight) /
//                         (expandedHeight - kToolbarHeight);
//                 return FlexibleSpaceBar(
//                   titlePadding:
//                       const EdgeInsetsDirectional.only(start: 20, bottom: 16),
//                   title: Padding(
//                     padding: const EdgeInsets.only(right: 16.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Expanded(
//                           child: Padding(
//                             padding: EdgeInsets.only(
//                                 left: 5 * (1 - fraction) > 0
//                                     ? 5 * (1 - fraction)
//                                     : 0),
//                             child: MyText(
//                               text: title ?? "",
//                               color: commonTextColor,
//                               fontSize: 17.sp,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 18),
//                         CustomContainer(
//                           horizontalPadding: 0.0,
//                           verticalPadding: 0.0,
//                           height: 10.w,
//                           width: 10.w,
//                           color: Colors.blue.shade100,
//                           radius: 10.w,
//                           child: Center(
//                             child: MyText(
//                               text: "N",
//                               color: commonTextColor,
//                               fontSize: 18.sp,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 );
//               }),
//               expandedHeight: 11.h,
//               backgroundColor: bgColor ?? white),
//           SliverToBoxAdapter(
//               child: ConstrainedBox(
//             constraints: BoxConstraints(minHeight: 100.h - 15.h),
//             child: Container(
//                 color: appBarColor ?? white,
//                 padding: const EdgeInsets.only(top: 16.0),
//                 child: child),
//           ))
//         ],
//       ),
//     );
//   }
// }

// class CustomCollapsableBarTab extends StatelessWidget {
//   final Widget? child;
//   final Function()? onBackClick;
//   final String? title;
//   final Color? coloricon;
//   final Color? appBarColor;
//   final String? icon;
//   final Color? bgColor;
//   final ScrollPhysics? physics;
//   final ScrollController? controller;
//   final TabBar bottomWidget;
//   final int tabLength;
//   const CustomCollapsableBarTab(
//       {super.key,
//       this.child,
//       this.title,
//       this.bgColor,
//       this.coloricon,
//       this.appBarColor,
//       this.onBackClick,
//       this.controller,
//       required this.bottomWidget,
//       this.tabLength = 1,
//       this.physics,
//       this.icon});

//   @override
//   Widget build(BuildContext context) {
//     double expandedHeight = 3.h;

//     return DefaultTabController(
//       length: tabLength,
//       child: Scaffold(
//           body: NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return [
//             SliverAppBar(
//                 elevation: 1.5,
//                 pinned: true,
//                 flexibleSpace: LayoutBuilder(builder: (context, constraints) {
//                   final fraction =
//                       max(0, constraints.biggest.height - kToolbarHeight) /
//                           (expandedHeight - kToolbarHeight);
//                   return FlexibleSpaceBar(
//                     titlePadding:
//                         const EdgeInsetsDirectional.only(start: 20, bottom: 16),
//                     title: Padding(
//                       padding: const EdgeInsets.only(right: 16.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Expanded(
//                             child: Padding(
//                               padding: EdgeInsets.only(
//                                   left: 5 * (1 - fraction) > 0
//                                       ? 5 * (1 - fraction)
//                                       : 0),
//                               child: MyText(
//                                 text: title ?? "",
//                                 color: commonTextColor,
//                                 fontSize: 17.sp,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 18),
//                           CustomContainer(
//                             horizontalPadding: 0.0,
//                             verticalPadding: 0.0,
//                             height: 10.w,
//                             width: 10.w,
//                             color: Colors.blue.shade100,
//                             radius: 10.w,
//                             child: Center(
//                               child: MyText(
//                                 text: "N",
//                                 color: commonTextColor,
//                                 fontSize: 18.sp,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 }),
//                 expandedHeight: 11.h,
//                 backgroundColor: bgColor ?? white),
//             SliverPersistentHeader(
//               delegate: _SliverAppBarDelegate(
//                 bottomWidget,
//               ),
//               pinned: true,
//             ),
//           ];
//         },
//         body: child ?? const SizedBox.shrink(),
//       )),
//     );
//   }
// }

// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   _SliverAppBarDelegate(this._tabBar);

//   final TabBar _tabBar;

//   @override
//   double get minExtent => _tabBar.preferredSize.height;
//   @override
//   double get maxExtent => _tabBar.preferredSize.height;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       color: white,
//       child: _tabBar,
//     );
//   }

//   @override
//   bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
//     return false;
//   }
// }

// // ignore: must_be_immutable
// class MyWidget extends StatelessWidget implements PreferredSizeWidget {
//   Widget? child;
//   double? size;
//   @override
//   Size get preferredSize => Size.fromHeight(size ?? 0);
//   MyWidget({this.child, this.size});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: child,
//     ); // Your custom widget implementation.
//   }
// }

// // ignore: must_be_immutable
// class CustomCollapsableBar2 extends StatelessWidget {
//   final Widget? child;
//   final Function()? onBackClick;
//   final String? title;
//   final String? subTitle;
//   final Color? coloricon;
//   final Color? appBarColor;
//   final String? icon;
//   final Color? bgColor;
//   Widget? bottomWidget;
//   CustomCollapsableBar2(
//       {super.key,
//       this.child,
//       this.subTitle,
//       this.title,
//       this.bgColor = white,
//       this.coloricon,
//       this.bottomWidget,
//       this.appBarColor,
//       this.onBackClick,
//       this.icon});

//   @override
//   Widget build(BuildContext context) {
//     double expandedHeight = 1.h;

//     return Scaffold(
//         body: NestedScrollView(
//       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//         return [
//           SliverAppBar(
//             elevation: 1.5,
//             pinned: true,
//             leading: Tooltip(
//               message: "Back",
//               child: IconButton(
//                 onPressed: onBackClick,
//                 icon: const Icon(
//                   Icons.arrow_back_ios,
//                   size: 18.0,
//                   color: Colors.black,
//                 ),
//                 color: white,
//               ),
//             ),
//             flexibleSpace: LayoutBuilder(builder: (context, constraints) {
//               final fraction =
//                   max(0, constraints.biggest.height - kToolbarHeight) /
//                       (expandedHeight - kToolbarHeight);
//               return FlexibleSpaceBar(
//                 titlePadding:
//                     const EdgeInsetsDirectional.only(start: 40, bottom: 20),
//                 title: Padding(
//                   padding: const EdgeInsets.only(right: 2.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         child: Padding(
//                             padding: EdgeInsets.only(
//                                 left: 5 * (1 - fraction) > 0
//                                     ? 5 * (1 - fraction)
//                                     : 0),
//                             child: MyText(
//                               text: title ?? "",
//                               color: Colors.black,
//                               fontSize: subTitle != null ? 14 : 16,
//                               textMaxLines: 1,
//                             )),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             }),
//             expandedHeight: 13.h,
//             // bottom: MyWidget(
//             //     size: 10.0,
//             //     child: Padding(
//             //       padding: const EdgeInsets.only(top: 6.0),
//             //       child: bottomWidget,
//             //     )),
//             backgroundColor: bgColor ?? const Color(0xFFFFF4F4),
//           ),
//           SliverPersistentHeader(
//             delegate: _SliverAppBarDelegate2(
//               bottomWidget,
//             ),
//             pinned: true,
//           ),
//         ];
//       },
//       body: SizedBox(
//           height: 80.h,
//           child:
//               SingleChildScrollView(child: child ?? const SizedBox.shrink())),
//     ));

//     // CustomScrollView(
//     //   slivers: [

//     //     SliverToBoxAdapter(
//     //         child: Column(
//     //       children: [
//     //         ConstrainedBox(
//     //           constraints: BoxConstraints(minHeight: 100.h - 79),
//     //           child: Container(color: appBarColor ?? white, child: child),
//     //         ),

//     //       ],
//     //     ))
//     //   ],
//     // );
//   }
// }

// class _SliverAppBarDelegate2 extends SliverPersistentHeaderDelegate {
//   _SliverAppBarDelegate2(this._bottomWidget);

//   final Widget? _bottomWidget;

//   @override
//   double get minExtent => 30;
//   @override
//   double get maxExtent => 30;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       color: white,
//       child: _bottomWidget,
//     );
//   }

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }

//   // @override
//   // bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
//   //   return false;
//   // }
// }
