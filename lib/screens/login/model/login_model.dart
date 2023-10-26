import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final int? customerId;
  final String? mobileno;
  final String? smsresponse;

  const LoginModel({this.customerId, this.mobileno, this.smsresponse});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        customerId: json['customer_id'] as int?,
        mobileno: json['mobileno'] as String?,
        smsresponse: json['smsresponse'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'customer_id': customerId,
        'mobileno': mobileno,
        'smsresponse': smsresponse,
      };

  @override
  List<Object?> get props => [customerId, mobileno, smsresponse];
}
