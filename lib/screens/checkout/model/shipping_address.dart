import 'package:equatable/equatable.dart';

class ShippingAddress extends Equatable {
  final int? customerShippingAddressId;
  final String? address;
  final String? area;
  final String? flat;
  final String? landmark;
  final String? city;
  final String? pincode;
  final int? isDefault;
  final String? societyName;
  final String? addressType;
  final String? addressTypeName;

  const ShippingAddress({
    this.customerShippingAddressId,
    this.address,
    this.area,
    this.flat,
    this.landmark,
    this.city,
    this.pincode,
    this.isDefault,
    this.societyName,
    this.addressType,
    this.addressTypeName,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) {
    return ShippingAddress(
      customerShippingAddressId: json['customer_shipping_address_id'] as int?,
      address: json['address'] as String?,
      area: json['area'] as String?,
      flat: json['flat'] as String?,
      landmark: json['landmark'] as String?,
      city: json['city'] as String?,
      pincode: json['pincode'] as String?,
      isDefault: json['is_default'] as int?,
      societyName: json['society_name'] as String?,
      addressType: json['address_type'] as String?,
      addressTypeName: json['address_type_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'customer_shipping_address_id': customerShippingAddressId,
        'address': address,
        'area': area,
        'flat': flat,
        'landmark': landmark,
        'city': city,
        'pincode': pincode,
        'is_default': isDefault,
        'society_name': societyName,
        'address_type': addressType,
        'address_type_name': addressTypeName,
      };

  @override
  List<Object?> get props {
    return [
      customerShippingAddressId,
      address,
      area,
      flat,
      landmark,
      city,
      pincode,
      isDefault,
      societyName,
      addressType,
      addressTypeName,
    ];
  }
}
