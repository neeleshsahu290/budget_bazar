import 'package:equatable/equatable.dart';

import 'shipping_address.dart';

class UserDetailsModel extends Equatable {
  final int? customerId;
  final String? photo;
  final String? name;
  final String? mobileno;
  final String? emailid;
  final String? address;
  final String? pincode;
  final int? cartitemcount;
  final List<ShippingAddress>? shippingAddress;

  const UserDetailsModel({
    this.customerId,
    this.photo,
    this.name,
    this.mobileno,
    this.emailid,
    this.address,
    this.pincode,
    this.cartitemcount,
    this.shippingAddress,
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
    return UserDetailsModel(
      customerId: json['customer_id'] as int?,
      photo: json['photo'] as String?,
      name: json['name'] as String?,
      mobileno: json['mobileno'] as String?,
      emailid: json['emailid'] as String?,
      address: json['address'] as String?,
      pincode: json['pincode'] as String?,
      cartitemcount: json['cartitemcount'] as int?,
      shippingAddress: (json['shipping_address'] as List<dynamic>?)
          ?.map((e) => ShippingAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'customer_id': customerId,
        'photo': photo,
        'name': name,
        'mobileno': mobileno,
        'emailid': emailid,
        'address': address,
        'pincode': pincode,
        'cartitemcount': cartitemcount,
        'shipping_address': shippingAddress?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      customerId,
      photo,
      name,
      mobileno,
      emailid,
      address,
      pincode,
      cartitemcount,
      shippingAddress,
    ];
  }
}
