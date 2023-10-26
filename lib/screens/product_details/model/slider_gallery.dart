import 'package:equatable/equatable.dart';

class SliderGallery extends Equatable {
  final int? productsGalleryId;
  final String? photo;

  const SliderGallery({this.productsGalleryId, this.photo});

  factory SliderGallery.fromJson(Map<String, dynamic> json) => SliderGallery(
        productsGalleryId: json['products_gallery_id'] as int?,
        photo: json['photo'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'products_gallery_id': productsGalleryId,
        'photo': photo,
      };

  @override
  List<Object?> get props => [productsGalleryId, photo];
}
