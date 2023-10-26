import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jds_new/constants/constant.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

// extension CurrencyFormatter on String {
//   String formatCurrency() {
//     var formatter = NumberFormat.simpleCurrency(
//         locale: Platform.localeName, name: 'INR', decimalDigits: 0);
//     return formatter.format(double.parse(this));
//   }

//   String toCapitalized() =>
//       length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
//   String toTitleCase() => replaceAll(RegExp(' +'), ' ')
//       .split(' ')
//       .map((str) => str.toCapitalized())
//       .join(' ');
// }

// extension DateOnlyCompare on DateTime {
//   bool isSameDate(DateTime other) {
//     return year == other.year && month == other.month && day == other.day;
//   }
// }

void launchURL(String url, {var launchMode = LaunchMode.inAppWebView}) async {
  // if (await canLaunchUrl(Uri.parse(url))) {
  //   await launchUrl(Uri.parse(url));
  // } else {
  //   debugPrint('Could not launch $url');
  // }

  if (!await launchUrl(Uri.parse(url), mode: launchMode)) {
    throw 'Could not launch $url';
  }
}

// void launchZoomApp(String meetingUrl, {onError}) async {
//   try {
//     debugPrint("launchZoomApp $meetingUrl");
//     await launchUrl(Uri.parse(meetingUrl));
//   } catch (error) {
//     if (error is PlatformException) {
//       debugPrint(
//           "launchZoomApp error ${error.code} , ${error.code == 'ACTIVITY_NOT_FOUND'} ");
//       if (onError != null) onError(error.code);
//     } else {
//       launchURL("zoomus://");
//     }
//     //debugPrint("launchZoomApp error $error");
//   }
// }

// bool isVideo(String? fileType) {
//   if (fileType == null || fileType.isEmpty) return false;
//   List<String> videoTypes = [
//     "webm",
//     "mov",
//     "amv",
//     "mp4",
//     "m4v",
//     "mpg",
//     "mpeg",
//     "wav",
//     "mkv",
//   ];
//   return (videoTypes.contains(fileType.toLowerCase()));
// }

// bool isImage(String? fileType) {
//   if (fileType == null || fileType.isEmpty) return false;
//   List<String> imageTypes = [
//     "jpg",
//     "jpeg",
//     "jfif",
//     "exif",
//     "tiff",
//     "gif",
//     "bmp",
//     "png",
//     "ppm",
//     "pgm",
//     "webp",
//     "img"
//   ];
//   return (imageTypes.contains(fileType.toLowerCase()));
//}

bool isPDF(String? fileType) {
  if (fileType == null || fileType.isEmpty) return false;
  List<String> fileTypes = ["pdf"];
  return (fileTypes.contains(fileType.toLowerCase()));
}

/*EMAIL VALIDATOR*/
bool isValidEmail(String? emailText) {
  if (emailText == null || emailText.isEmpty) return false;
  Pattern pattern = r"^([a-zA-Z0-9_\-\.\,]+)@([a-zA-Z]{4,})\.([a-zA-Z]{2,})$";
  RegExp regex = RegExp(pattern.toString());
  return regex.hasMatch(emailText);
}

bool isValidPhone(String phone) {
  Pattern pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regex = RegExp(pattern.toString());
  return regex.hasMatch(phone);
}

String getCurrentDate({format = "dd'th' MMM yyyy"}) {
  return DateFormat(format).format(DateTime.now());
}

String getDate(date, {format = "dd'th' MMM yyyy"}) {
  try {
    if (date == null) return "";
    DateTime dateTime = date is DateTime ? date : DateTime.parse(date);
    format =
        format.toString().replaceAll("th", getDayOfMonthSuffix(dateTime.day));
    return DateFormat(format).format(dateTime);
  } catch (error) {
    debugPrint(error.toString());
    return date;
  }
}

String getDateWithTime(date, {format = "dd'th' MMM yyyy, hh:mm a"}) {
  try {
    if (date == null) return "";
    DateTime dateTime = date is DateTime ? date : DateTime.parse(date);
    format =
        format.toString().replaceAll("th", getDayOfMonthSuffix(dateTime.day));
    return DateFormat(format).format(dateTime);
  } catch (error) {
    debugPrint(error.toString());
    return date;
  }
}

// DateTime getDateValue(String dateStr, {format = "YYYY"}) {
//   try {
//     if ( == null) return "";
//     DateTime dateTime = date is DateTime ? date : DateTime.parse(date);
//     format =
//         format.toString().replaceAll("th", getDayOfMonthSuffix(dateTime.day));
//     return DateFormat(format).format(dateTime);
//   } catch (error) {
//     debugPrint(error.toString());
//     return date;
//   }

// }

DateTime formatedEditDate(String? dateTime) {
  if (dateTime == null) return DateTime.now();
  var inputFormat = DateFormat('yyyy-MM-dd');
  var inputDate = inputFormat.parse(dateTime); // <-- dd/MM 24H format

  return inputDate;
}

String formatedSeeEditDate(String? dateTime) {
  try {
    if (dateTime == null) return "";
    var inputFormat = DateFormat('h:mm a');
    var inputDate = inputFormat.parse(dateTime);

    return DateFormat('hh  :  mm  :  a').format(inputDate);
  } catch (e) {
    return dateTime ?? "";
  }
}

String getDayOfMonthSuffix(int dayNum) {
  if (!(dayNum >= 1 && dayNum <= 31)) {
    throw Exception('Invalid day of month');
  }

  if (dayNum >= 11 && dayNum <= 13) {
    return 'th';
  }

  switch (dayNum % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}

String capsOfFirstChar(String? input) {
  if (input == null || input.isEmpty) return input!;
  if (input.length < 2) return input[0].toUpperCase();

  return '${(input[0].toUpperCase())}${input.substring(1).toLowerCase()}';
}

String capsOfWord(String? input) {
  if (input == null || input.isEmpty) return input!;
  var splitStr = input.toLowerCase().split(' ');
  for (var i = 0; i < splitStr.length; i++) {
    // You do not need to check if i is larger than splitStr length, as your for does that for you
    // Assign it back to the array
    splitStr[i] = splitStr[i][0].toUpperCase() + splitStr[i].substring(1);
  }
  // Directly return the joined string
  return splitStr.join(' ');
}

String sprintf(String template, List<Object> arguments) {
  String result = "";
  int argumentsIndex = 0;
  for (int index = 0; index < template.length; index++) {
    if (template.codeUnitAt(index) == 37 /* ascii '%' */) {
      index++;

      /// to ignore first char after %
      result += arguments[argumentsIndex++].toString();
    } else {
      result += template.substring(index, index + 1);
    }
  }
  return result;
}

//    void share(String text) {
//   if (text == null || text.isEmpty) return;
//   Share.share(text);
// }

bool isSuccess(int statusCode) {
  return statusCode == 200 || statusCode == 201 || statusCode == 202;
}

// shareBook({required String bookName}) {
//   shareFeature(
//       str:
//           "Hi, I’m reading $bookName on Better You. Join to get the most valuable insights from the bite-sized bestsellers in minutes");
// }

shareFeature({required String str}) {
  if (Platform.isIOS) {
    Share.share('$str Apple store link will go here.');
  } else {
    Share.share('$str\n\nDownload the app now from -\n$appPlayStoreLink');
  }
}
// deviceInfo() async {
//   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

//   Map info = {};

//   if (Platform.isAndroid) {
//     AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//     info["model"] = androidInfo.model;
//     info["brand"] = androidInfo.brand;
//     info['version'] = androidInfo.version.sdkInt;
//     info["platform"] = "android";
//     info['release_version'] = androidInfo.version.release;
//   }
//   if (Platform.isIOS) {
//     IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
//     info["model"] = iosDeviceInfo.model;
//     info["brand"] = iosDeviceInfo.name;
//     info['release_version:'] = iosDeviceInfo.utsname.release;
//     info["version:"] = iosDeviceInfo.utsname.version;
//     info['platform'] = "ios";
//   }
//   return info;
// }

// Future<File> rotateImage(var filePath) async {
//   ImageProperties properties =
//       await FlutterNativeImage.getImageProperties(filePath);
//   debugPrint("orientation ${properties.orientation}");
//   debugPrint("rotationFixedImage1.lengthSync()");
//   debugPrint(File(filePath).lengthSync().toString());
//   File compressedFile =
//       await FlutterNativeImage.compressmage(filePath, quality: 90);
//   File rotationFixedImage =
//       await FlutterExifRotation.rotateImage(path: compressedFile.path);
//   debugPrint("rotationFixedImage.lengthSync()");
//   debugPrint(rotationFixedImage.lengthSync().toString());
//   return rotationFixedImage;
// }

// // Future<String> downloadAndSaveFile(
// //   String url,
// // ) async {
// //   final filename = url.substring(url.lastIndexOf("/") + 1);
// //   final Directory directory = await getApplicationDocumentsDirectory();
// //   final String filePath = '${directory.path}/$filename';
// //   final http.Response response = await http.get(Uri.parse(url));
// //   final File file = File(filePath);
// //   await file.writeAsBytes(response.bodyBytes);
// //   debugPrint("filePath $filePath");
// //   return filePath;
// // }

// Future<void> launchUrl(String url) async {
//   final Uri _url = Uri.parse(url);

//   if (!await launchUrl(_url)) {
//     throw 'Could not launch $_url';
//   }
// }

TValue? case2<TOptionType, TValue>(
  TOptionType selectedOption,
  Map<TOptionType, TValue> branches, [
  TValue? defaultValue,
]) {
  if (!branches.containsKey(selectedOption)) {
    return defaultValue;
  }

  return branches[selectedOption];
}

String getCoudnTime(Duration myDuration) {
  String strDigits(int n) => n.toString().padLeft(2, '0');
  // final days = strDigits(myDuration.inDays);
  // Step 7
  final hours = strDigits(myDuration.inHours.remainder(24));
  final minutes = strDigits(myDuration.inMinutes.remainder(60));
  final seconds = strDigits(myDuration.inSeconds.remainder(60));

  return "$hours:$minutes:$seconds";
}
