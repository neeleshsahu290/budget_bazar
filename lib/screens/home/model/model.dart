// import 'package:equatable/equatable.dart';

// import 'result.dart';

// class Model extends Equatable {
//   final int? code;
//   final String? status;
//   final String? messageDev;
//   final String? message;
//   final List<HomeData>? results;

//   const Model({
//     this.code,
//     this.status,
//     this.messageDev,
//     this.message,
//     this.results,
//   });

//   factory Model.fromJson(Map<String, dynamic> json) => Model(
//         code: json['code'] as int?,
//         status: json['status'] as String?,
//         messageDev: json['message_dev'] as String?,
//         message: json['message'] as String?,
//         results: (json['results'] as List<dynamic>?)
//             ?.map((e) => HomeData.fromJson(e as Map<String, dynamic>))
//             .toList(),
//       );

//   Map<String, dynamic> toJson() => {
//         'code': code,
//         'status': status,
//         'message_dev': messageDev,
//         'message': message,
//         'results': results?.map((e) => e.toJson()).toList(),
//       };

//   @override
//   bool get stringify => true;

//   @override
//   List<Object?> get props => [code, status, messageDev, message, results];
// }
