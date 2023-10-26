import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jds_new/constants/assets.dart';
import 'package:jds_new/screens/home/ui/home_screen.dart';
import 'package:jds_new/screens/home/widgets/slider_dots.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final indexprovider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

class ImageSlider extends ConsumerWidget {
  const ImageSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            enableInfiniteScroll: true,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              ref.read(indexprovider.notifier).state = index;
            },
          ),
          items: ref
              .watch(homeScreenProvider)
              .bannerList
              .map((item) => Center(
                      child: SliderImageView(
                    url: item.photo ?? "",
                  )))
              .toList(),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (int i = 0;
              i < ref.watch(homeScreenProvider).bannerList.length;
              i++)
            SlideDots(i == ref.watch(indexprovider))
        ]),
      ],
    );
  }
}

// final List<Widget> imageSliders = imgList
//     .map((item) => ClipRRect(
//         borderRadius: const BorderRadius.all(Radius.circular(5.0)),
//         child: Stack(
//           children: <Widget>[
//             Image.network(item, fit: BoxFit.cover, width: 100.w),
//             Positioned(
//               bottom: 0.0,
//               left: 0.0,
//               right: 0.0,
//               child: Container(
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       Color.fromARGB(200, 0, 0, 0),
//                       Color.fromARGB(0, 0, 0, 0)
//                     ],
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter,
//                   ),
//                 ),
//                 padding: const EdgeInsets.symmetric(
//                     vertical: 10.0, horizontal: 20.0),
//                 child: Text(
//                   'No. ${imgList.indexOf(item)} image',
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 20.0,
//                     fontWeight: FontWeight .bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         )))
//     .toList();

class SliderImageView extends StatelessWidget {
  final String url;

  const SliderImageView({
    Key? key,
    required this.url,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 60.w,
      child: url.isNotEmpty
          ? CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
              placeholder: (context, url) {
                return Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                  child: Image.asset(placeHolderImg, fit: BoxFit.cover),
                );
              },

              // progressIndicatorBuilder: (context, str, loadingProgress) {
              //   return Center(
              //       child: CustomProgressIndicator(
              //     value: loadingProgress.totalSize != null
              //         ? loadingProgress.downloaded / loadingProgress.totalSize!
              //         : null,
              //   ));
              // },
              // errorWidget: (context, str, errorWidget) {
              //   var placeHolder = "";
              //   if (fallBackText.trim().isNotEmpty) {
              //     var nameWithSpaces = fallBackText.trim().split(' ');
              //     if (nameWithSpaces.length > 1) {
              //       placeHolder =
              //           "${nameWithSpaces.first[0].toUpperCase()}${nameWithSpaces[1][0].toUpperCase()}";
              //     } else {
              //       placeHolder =
              //           "${nameWithSpaces.first[0].toUpperCase()}${nameWithSpaces.first[1].toUpperCase()}";
              //     }
              //   }

              //   return Container(
              //     color: Colors.grey.shade200,
              //     alignment: Alignment.center,
              //     child: placeHolder.trim().isEmpty
              //         ? const Icon(Icons.book)
              //         : MyText(
              //             text: placeHolder,
              //             fontSize: fontSize,
              //             fontWeight: FontWeight.w600),
              //   );
              // },
            )
          : Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.grey.shade300,
              child: Image.asset(placeHolderImg, fit: BoxFit.cover),
            ),
    );
  }
}
