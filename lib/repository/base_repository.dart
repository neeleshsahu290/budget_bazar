import 'package:jds_new/repository/cart_repository.dart';
import 'package:jds_new/repository/checkout_repository.dart';
import 'package:jds_new/repository/home_repository.dart';
import 'package:jds_new/repository/order_repository.dart';
import 'package:jds_new/repository/product_repository.dart';
import 'package:jds_new/repository/user_repository.dart';

class Repository {
  static final Repository _singleton = Repository._internal();

  factory Repository() => _singleton;

  Repository._internal() {
    // private constructor that creates the singleton instance
  }
  final HomeRepository _homeRepository = HomeRepository();
  final ProductRepository _productRepository = ProductRepository();
  final CartRepository _cartRepository = CartRepository();
  final UserRepository _userRepository = UserRepository();
  final CheckoutRepository _checkoutRepository = CheckoutRepository();
  final OrderRepository _orderRepository = OrderRepository();

  // get Home Page Data
  Future<Map<String, dynamic>> getHomePage() => _homeRepository.getHomePage();

  // get Product Details Data
  Future<Map<String, dynamic>> getProductData({required var productId}) =>
      _productRepository.getProductData(productId: productId);

  // get Category Data
  Future<Map<String, dynamic>> getCategoryData(
          {required var productCatId, required var productMainCatId}) =>
      _productRepository.getCategoryData(
          productCatId: productCatId, productMainCatId: productMainCatId);

  // get Cart Data
  Future<Map<String, dynamic>> getCartData() => _cartRepository.getCartData();

  // add Product To Cart
  Future<Map<String, dynamic>> addProductToCart(
          {required var productId,
          required var productUnitTypeId,
          required var quantity}) =>
      _cartRepository.addProductToCart(
          productId: productId,
          productUnitTypeId: productUnitTypeId,
          quantity: quantity);

  // add Product To Cart
  Future<Map<String, dynamic>> removeProductToCart(
          {required var productId,
          required var productUnitTypeId,
          required var quantity}) =>
      _cartRepository.removeProductToCart(
          productId: productId,
          productUnitTypeId: productUnitTypeId,
          quantity: quantity);

  // get Search List
  Future<Map<String, dynamic>> searchProducts({
    required var keyword,
  }) =>
      _productRepository.searchProducts(
        keyword: keyword,
      );

  // login User
  Future<Map<String, dynamic>> loginUser({
    required var mobileNo,
  }) =>
      _userRepository.loginUser(
        mobileNo: mobileNo,
      );

  // register User
  Future<Map<String, dynamic>> registerUser({
    required var mobileNo,
  }) =>
      _userRepository.registerUser(
        mobileNo: mobileNo,
      );

  // verify User
  Future<Map<String, dynamic>> verifyUser(
          {required var otp, required var customerId}) =>
      _userRepository.verifyUser(otp: otp, customerId: customerId);

  // get User Data
  Future<Map<String, dynamic>> getUserDetails() =>
      _checkoutRepository.getUserDetails();

  // place Order
  Future<Map<String, dynamic>> checkoutOrder() =>
      _checkoutRepository.checkoutOrder();

  // add Address
  Future<Map<String, dynamic>> addAddress(
          {required var address,
          required var flat,
          required var area,
          required var landmark,
          required var city,
          required var pincode,
          required var isDefault,
          required var customerShippingAddressId,
          required var societyName,
          required var addressType}) =>
      _checkoutRepository.addAddress(
          address: address,
          addressType: addressType,
          area: area,
          city: city,
          customerShippingAddressId: customerShippingAddressId,
          flat: flat,
          isDefault: isDefault,
          landmark: landmark,
          pincode: pincode,
          societyName: societyName);

  // verify User
  Future<Map<String, dynamic>> removeAddress({
    required var customerShippingAddressId,
  }) =>
      _checkoutRepository.removeAddress(
          customerShippingAddressId: customerShippingAddressId);

  // place Order
  Future<Map<String, dynamic>> userOrderList() =>
      _orderRepository.userOrderList();
}

var repository = Repository();
