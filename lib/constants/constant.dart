//const String itemUrl = "https://test-series-neel-data-node.s3.ap-south-1.amazonaws.com/";

const String localStorageContainer = "the_budget_bazar_App";
const String deviceToken = "device_token";
const String authToken = "auth_token";
const String loginStatus = "login_status";
const String savedUserId = "Id";
const String userProfileData = "user_profile_data";
const String termsAndConditions =
    "https://getdemo.work/jalaram/terms&condition.html";
const String aboutUs = "http://getdemo.work/jalaram/static/aboutus.html";
const String contactUs = "http://getdemo.work/jalaram/static/contactus.html";

const String refund = "https://getdemo.work/jalaram/refund.html";
const String privacyPolicy = "";
const success = "success";
const failure = "failure";
const error = "error";
const verifyError = "verifyError";
const userEmail = "userEmail";
const userUid = "userUid";
const userName = "username";
const userMobileNo = "userMobileNo";
const userDisplayName = "userDisplayName";
const unauthorized = "unauthorized";
const failureMessage = "Something went wrong, Please try again";
const nightModeOn = "NightModeOn";
const String premiumStatus = "premiumStatus";
const String fcmToken = "fcmToken";
const String nouseToken = "nouseToken";
const String sessionCookie = "sessionCookie";
const String isLoggedIn = "isLoggedIn";
const String cookieTime = "cookieTime";
const String loginTime = "loginTime";
const String appCode = "kbntkx";
const String appPlayStoreLink = "Share My app";

const noDataText = "No data found.";

//const userId = 'userId';

// ListTile(
//   dense: true,
//   title: const Text(
//     "My Orders",
//     style: TextStyle(
//         color: Colors.black, fontWeight: FontWeight.w700),
//   ),
//   leading: const Icon(
//     Icons.shopping_cart,
//     color: Colors.black,
//   ),
//   onTap: () async {
//     var userId = await StorageManager.readString("userId");
//     Get.back();
//     Get.to(OrderHistory(
//         isFormSuccess: false, customerId: userId ?? ""));
//   },
// ),
// ListTile(
//   dense: true,
//   title: const Text(
//     "Edit Profile",
//     style: TextStyle(
//         color: Colors.black, fontWeight: FontWeight.w700),
//   ),
//   leading: const Icon(
//     Icons.person,
//     color: Colors.black,
//   ),
//   onTap: () {
//     getUserDetails();
//     Get.back();
//     Get.to(() => EditScreenView(
//         customerDetailsModel: customerDetailsModel!));
//   },
// ),
// ListTile(
//   title: const Text(
//     "About Us",
//     style: TextStyle(
//         color: Colors.black, fontWeight: FontWeight.w700),
//   ),
//   leading: const Icon(
//     Icons.group,
//     color: Colors.black,
//   ),
//   onTap: () {
//     Get.back();
//     Get.to(WebViewScreen(
//         title: "About Us",
//         url: "http://getdemo.work/jalaram/static/aboutus.html"));
//   },
// ),
// ListTile(
//   dense: true,
//   title: const Text(
//     "Support",
//     style: TextStyle(
//         color: Colors.black, fontWeight: FontWeight.w700),
//   ),
//   leading: const Icon(
//     Icons.support_agent,
//     color: Colors.black,
//   ),
//   onTap: () {
//     Get.back();
//     Get.to(WebViewScreen(
//         title: "About Us",
//         url:
//             "http://getdemo.work/jalaram/static/contactus.html"));
//   },
// ),
// ListTile(
//   dense: true,
//   title: const Text(
//     "Refund",
//     style: TextStyle(
//         color: Colors.black, fontWeight: FontWeight.w700),
//   ),
//   leading: const Icon(
//     Icons.money_off,
//     color: Colors.black,
//   ),
//   onTap: () {
//     Get.back();
//     Get.to(WebViewScreen(
//         title: "Refund",
//         url: "https://getdemo.work/jalaram/refund.html"));
//   },
// ),
// ListTile(
//   dense: true,
//   title: const Text(
//     "Terms & Condtions",
//     style: TextStyle(
//         color: Colors.black, fontWeight: FontWeight.w700),
//   ),
//   leading: const Icon(
//     Icons.policy,
//     color: Colors.black,
//   ),
//   onTap: () {
//     Get.back();
//     Get.to(WebViewScreen(
//         title: "Terms & Condtions",
//         url:
//             "https://getdemo.work/jalaram/terms&condition.html"));
//   },
// ),
// ListTile(
//   dense: true,
//   title: const Text(
//     "Logout",
//     style: TextStyle(
//         color: Colors.black, fontWeight: FontWeight.w700),
//   ),
//   leading: const Icon(
//     Icons.logout,
//     color: Colors.black,
//   ),
//   onTap: () {
//     Get.back();
//     StorageManager.clearSharedPref();
//     Get.off(Loginpage());
//   },
// ),
