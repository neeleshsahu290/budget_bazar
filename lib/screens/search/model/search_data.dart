class SearchData {
  SearchData({
    this.productsId,
    this.productsCategoryId,
    this.name,
    this.photo,
    this.description,
    this.cgst,
    this.sgst,
    this.price,
    this.qty,
  });

  int? productsId;
  int? productsCategoryId;
  String? name;
  String? photo;
  String? description;
  dynamic cgst;
  dynamic sgst;
  dynamic price;
  int? qty;

  factory SearchData.fromJson(Map<String, dynamic> json) => SearchData(
        productsId: json["products_id"],
        productsCategoryId: json["products_category_id"],
        name: json["name"],
        photo: json["photo"],
        description: json["description"],
        cgst: json["cgst"],
        sgst: json["sgst"],
        price: json["price"],
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "products_id": productsId,
        "products_category_id": productsCategoryId,
        "name": name,
        "photo": photo,
        "description": description,
        "cgst": cgst,
        "sgst": sgst,
        "price": price,
        "qty": qty,
      };
}
