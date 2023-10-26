import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jds_new/constants/app_color.dart';
import 'package:jds_new/constants/assets.dart';

import 'my_text.dart';

class CustomImageView extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final double cornerRadius;
  final bool isHorizontalCard;
  final String fallBackText;
  final double fontSize;
  final BoxFit fit;
  const CustomImageView(
      {Key? key,
      required this.url,
      this.width = 100.0,
      this.height = 100.0,
      this.cornerRadius = 100.0,
      this.isHorizontalCard = false,
      required this.fallBackText,
      this.fontSize = 22.0,
      this.fit = BoxFit.cover})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
          borderRadius: isHorizontalCard
              ? BorderRadius.only(
                  topLeft: Radius.circular(cornerRadius),
                  bottomLeft: Radius.circular(cornerRadius))
              : BorderRadius.circular(cornerRadius),
          child: CachedNetworkImage(
            imageUrl: url,
            fit: fit,
            placeholder: (context, url) => SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(placeHolderImg, fit: BoxFit.cover)),
            errorWidget: (context, str, errorWidget) {
              var placeHolder = "";
              if (fallBackText.trim().isNotEmpty) {
                var nameWithSpaces = fallBackText.trim().split(' ');
                if (nameWithSpaces.length > 1) {
                  placeHolder =
                      "${nameWithSpaces.first[0].toUpperCase()}${nameWithSpaces[1][0].toUpperCase()}";
                } else {
                  placeHolder =
                      "${nameWithSpaces.first[0].toUpperCase()}${nameWithSpaces.first[1].toUpperCase()}";
                }
              }

              return Container(
                color: Colors.grey.shade200,
                alignment: Alignment.center,
                child: placeHolder.trim().isEmpty
                    ? const Icon(Icons.book)
                    : MyText(
                        text: placeHolder,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w600),
              );
            },
          )),
    );
  }
}

class CustomSvgImageView extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final double cornerRadius;
  final bool isHorizontalCard;
  final String fallBackText;
  final double fontSize;
  final BoxFit fit;
  const CustomSvgImageView(
      {Key? key,
      required this.url,
      this.width = 100.0,
      this.height = 100.0,
      this.cornerRadius = 100.0,
      this.isHorizontalCard = false,
      required this.fallBackText,
      this.fontSize = 22.0,
      this.fit = BoxFit.contain})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
          borderRadius: isHorizontalCard
              ? BorderRadius.only(
                  topLeft: Radius.circular(cornerRadius),
                  bottomLeft: Radius.circular(cornerRadius))
              : BorderRadius.circular(cornerRadius),
          child: SvgPicture.network(
            // ignore: deprecated_member_use
            color: white,
            url,
            fit: fit,

            placeholderBuilder: (context) {
              return SvgPicture.asset(personIcon);
            },
          )),
    );
  }
}
