import 'package:equatable/equatable.dart';

class GetSearchAutocompletionListForProductsList extends Equatable {
  final int? id;
  final int? productsMainCategoryId;
  final int? productsCategoryId;
  final String? name;
  final int? typeval;
  final String? typename;

  const GetSearchAutocompletionListForProductsList({
    this.id,
    this.productsMainCategoryId,
    this.productsCategoryId,
    this.name,
    this.typeval,
    this.typename,
  });

  factory GetSearchAutocompletionListForProductsList.fromJson(
      Map<String, dynamic> json) {
    return GetSearchAutocompletionListForProductsList(
      id: json['id'] as int?,
      productsMainCategoryId: json['products_main_category_id'] as int?,
      productsCategoryId: json['products_category_id'] as int?,
      name: json['name'] as String?,
      typeval: json['typeval'] as int?,
      typename: json['typename'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'products_main_category_id': productsMainCategoryId,
        'products_category_id': productsCategoryId,
        'name': name,
        'typeval': typeval,
        'typename': typename,
      };

  @override
  List<Object?> get props {
    return [
      id,
      productsMainCategoryId,
      productsCategoryId,
      name,
      typeval,
      typename,
    ];
  }
}
