import 'package:equatable/equatable.dart';

class VerifyModel extends Equatable {
  final int? customerId;
  final String? mobileno;

  const VerifyModel({this.customerId, this.mobileno});

  factory VerifyModel.fromJson(Map<String, dynamic> json) => VerifyModel(
        customerId: json['customer_id'] as int?,
        mobileno: json['mobileno'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'customer_id': customerId,
        'mobileno': mobileno,
      };

  @override
  List<Object?> get props => [customerId, mobileno];
}
