// class HomeData {
//   List<BannerList>? bannerList;
//   List<ProductsMainCategoryList>? productsMainCategoryList;
// //  List<PopularProductsList>? popularProductsList;

//   HomeData(
//       {this.bannerList,
//       this.productsMainCategoryList,
//      // this.popularProductsList
//       });

//   HomeData.fromJson(Map<String, dynamic> json) {
//     if (json['banner_list'] != null) {
//       bannerList = <BannerList>[];
//       json['banner_list'].forEach((v) {
//         bannerList!.add(new BannerList.fromJson(v));
//       });
//     }
//     if (json['products_main_category_list'] != null) {
//       productsMainCategoryList = <ProductsMainCategoryList>[];
//       json['products_main_category_list'].forEach((v) {
//         productsMainCategoryList!.add(new ProductsMainCategoryList.fromJson(v));
//       });
//     }
//     // if (json['popular_products_list'] != null) {
//     //   popularProductsList = <PopularProductsList>[];
//     //   json['popular_products_list'].forEach((v) {
//     //     popularProductsList!.add(new PopularProductsList.fromJson(v));
//     //   });
//     // }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.bannerList != null) {
//       data['banner_list'] = this.bannerList!.map((v) => v.toJson()).toList();
//     }
//     if (this.productsMainCategoryList != null) {
//       data['products_main_category_list'] =
//           this.productsMainCategoryList!.map((v) => v.toJson()).toList();
//     }
//     // if (this.popularProductsList != null) {
//     //   data['popular_products_list'] =
//     //       this.popularProductsList!.map((v) => v.toJson()).toList();
//     // }
//     return data;
//   }
// }

// class BannerList {
//   int? homepageTopBannerId;
//   int? productId;
//   String? photo;
//   int? typeval;
//   String? typename;
//   String? productsMainCategoryId;
//   String? productsCategoryId;

//   BannerList(
//       {this.homepageTopBannerId,
//       this.productId,
//       this.photo,
//       this.typeval,
//       this.typename,
//       this.productsMainCategoryId,
//       this.productsCategoryId});

//   BannerList.fromJson(Map<String, dynamic> json) {
//     homepageTopBannerId = json['homepage_top_banner_id'];
//     productId = json['product_id'];
//     photo = json['photo'];
//     typeval = json['typeval'];
//     typename = json['typename'];
//     productsMainCategoryId = json['products_main_category_id'];
//     productsCategoryId = json['products_category_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['homepage_top_banner_id'] = this.homepageTopBannerId;
//     data['product_id'] = this.productId;
//     data['photo'] = this.photo;
//     data['typeval'] = this.typeval;
//     data['typename'] = this.typename;
//     data['products_main_category_id'] = this.productsMainCategoryId;
//     data['products_category_id'] = this.productsCategoryId;
//     return data;
//   }
// }

// class ProductsMainCategoryList {
//   int? productsMainCategoryId;
//   int? productsCategoryId;
//   String? name;
//   String? photo;

//   ProductsMainCategoryList(
//       {this.productsMainCategoryId,
//       this.productsCategoryId,
//       this.name,
//       this.photo});

//   ProductsMainCategoryList.fromJson(Map<String, dynamic> json) {
//     productsMainCategoryId = json['products_main_category_id'];
//     productsCategoryId = json['products_category_id'];
//     name = json['name'];
//     photo = json['photo'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['products_main_category_id'] = this.productsMainCategoryId;
//     data['products_category_id'] = this.productsCategoryId;
//     data['name'] = this.name;
//     data['photo'] = this.photo;
//     return data;
//   }
// }

// class PopularProductsList {
//   int? productsId;
//   String? name;
//   String? photo;
//   String? description;
//   int? maxDiscount;
//   List<ProductsUnitTypeList>? productsUnitTypeList;

//   PopularProductsList(
//       {this.productsId,
//       this.name,
//       this.photo,
//       this.description,
//       this.maxDiscount,
//       this.productsUnitTypeList});

//   PopularProductsList.fromJson(Map<String, dynamic> json) {
//     productsId = json['products_id'];
//     name = json['name'];
//     photo = json['photo'];
//     description = json['description'];
//     maxDiscount = json['max_discount'];
//     if (json['products_unit_type_list'] != null) {
//       productsUnitTypeList = <ProductsUnitTypeList>[];
//       json['products_unit_type_list'].forEach((v) {
//         productsUnitTypeList!.add(new ProductsUnitTypeList.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['products_id'] = this.productsId;
//     data['name'] = this.name;
//     data['photo'] = this.photo;
//     data['description'] = this.description;
//     data['max_discount'] = this.maxDiscount;
//     if (this.productsUnitTypeList != null) {
//       data['products_unit_type_list'] =
//           this.productsUnitTypeList!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class ProductsUnitTypeList {
//   int? productsUnitTypeId;
//   String? unitTypeName;
//   int? unitTypeDiscount;
//   int? unitTypeMrp;
//   int? unitTypePrice;
//   int? yoursavingprice;
//   int? unitTypeQty;
// //  bool? isOutOfStock;

//   ProductsUnitTypeList(
//       {this.productsUnitTypeId,
//       this.unitTypeName,
//       this.unitTypeDiscount,
//       this.unitTypeMrp,
//       this.unitTypePrice,
//       this.yoursavingprice,
//       this.unitTypeQty,
//     //  this.isOutOfStock
//       });

//   ProductsUnitTypeList.fromJson(Map<String, dynamic> json) {
//     productsUnitTypeId = json['products_unit_type_id'];
//     unitTypeName = json['unit_type_name'];
//     unitTypeDiscount = json['unit_type_discount'];
//     unitTypeMrp = json['unit_type_mrp'];
//     unitTypePrice = json['unit_type_price'];
//     yoursavingprice = json['yoursavingprice'];
//     unitTypeQty = json['unit_type_qty'];
//  //   isOutOfStock = json['is_out_of_stock'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['products_unit_type_id'] = this.productsUnitTypeId;
//     data['unit_type_name'] = this.unitTypeName;
//     data['unit_type_discount'] = this.unitTypeDiscount;
//     data['unit_type_mrp'] = this.unitTypeMrp;
//     data['unit_type_price'] = this.unitTypePrice;
//     data['yoursavingprice'] = this.yoursavingprice;
//     data['unit_type_qty'] = this.unitTypeQty;
//     //data['is_out_of_stock'] = this.isOutOfStock;
//     return data;
//   }
// }
