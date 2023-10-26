// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jds_new/constants/app_color.dart';
import 'package:jds_new/constants/assets.dart';
import 'package:jds_new/constants/constant.dart';
import 'package:jds_new/helper/navigator_help.dart';
import 'package:jds_new/helper/session_manager.dart';
import 'package:jds_new/provider/cart_notifier.dart';
import 'package:jds_new/screens/checkout/ui/checkout_screen.dart';
import 'package:jds_new/screens/login/ui/login.dart';
import 'package:jds_new/screens/shopping_cart/model/cart_data.dart';
import 'package:jds_new/screens/shopping_cart/model/cart_item_data.dart';
import 'package:jds_new/widget/custom_aleart_dialog.dart';
import 'package:jds_new/widget/custom_app_bar.dart';
import 'package:jds_new/widget/custom_image_view.dart';
import 'package:jds_new/widget/my_text.dart';
import 'package:jds_new/widget/primary_button.dart';
import 'package:jds_new/widget/progress_dilog.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../widget/empty_view.dart';

final cartProvider = ChangeNotifierProvider.autoDispose<CartNotifier>((ref) {
  return CartNotifier();
});

// ignore: must_be_immutable

// final indexprovider = StateProvider.autoDispose<int>((ref) {
//   return 0;
// });

// ignore: must_be_immutable
class ShoppingCartScreen extends ConsumerStatefulWidget {
  const ShoppingCartScreen({
    super.key,
  });

  @override
  ConsumerState<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends ConsumerState<ShoppingCartScreen> {
  getCartData({
    var isRefreshing = false,
  }) async {
    ref.read(cartProvider).getCartData(
          isRefreshing: isRefreshing,
        );
  }

  @override
  void initState() {
    super.initState();
    getCartData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "My Cart",
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: ref.watch(cartProvider).cartData.when(
            data: ((data) {
              CartData mData = data;
              if (mData.cartItemData != null &&
                  mData.cartItemData!.isNotEmpty) {
                return Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(children: [
                                mData.cartItemData != null &&
                                        mData.cartItemData!.isNotEmpty
                                    ? Wrap(
                                        children: List.generate(
                                            mData.cartItemData!.length,
                                            (index) => ShoppingItem(
                                                  onAddItemClick: () async {
                                                    int quant = mData
                                                            .cartItemData?[
                                                                index]
                                                            .qty ??
                                                        1;

                                                    //  if (quant > 1) {
                                                    progressDialog(context,
                                                        text: "Updating...");
                                                    await ref
                                                        .read(cartProvider)
                                                        .addProductToCart(
                                                            quant: quant + 1,
                                                            index: index);
                                                    Navigator.pop(context);
                                                    //  }
                                                  },
                                                  onRemoveItemClick: () async {
                                                    int quant = mData
                                                            .cartItemData?[
                                                                index]
                                                            .qty ??
                                                        1;

                                                    if (quant > 1) {
                                                      progressDialog(context,
                                                          text: "Updating...");
                                                      await ref
                                                          .read(cartProvider)
                                                          .addProductToCart(
                                                              quant: quant - 1,
                                                              index: index);
                                                      Navigator.pop(context);
                                                    }
                                                  },
                                                  onRemoveClick: () async {
                                                    progressDialog(context,
                                                        text: "Removing...");
                                                    int quant = mData
                                                            .cartItemData?[
                                                                index]
                                                            .qty ??
                                                        1;
                                                    await ref
                                                        .read(cartProvider)
                                                        .removeProductToCart(
                                                            quant: quant,
                                                            index: index);
                                                    Navigator.pop(context);
                                                  },
                                                  item: mData
                                                      .cartItemData![index],
                                                )))
                                    : const SizedBox.shrink(),
                                const SizedBox(
                                  height: 25.0,
                                ),
                                PhysicalModel(
                                  color: white,
                                  elevation: 0.5,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12.0, vertical: 4.0),
                                          child: MyText(
                                            text: "Price Details",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Divider(
                                          thickness: 0.2,
                                          height: 5.0,
                                          color: Colors.grey.shade600,
                                        ),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        ItemHorzCard(
                                            title: "Sub Total",
                                            description: mData.subtotal ?? 0),
                                        ItemHorzCard(
                                            title: "cgst",
                                            description:
                                                mData.deliveryCgst ?? 0),
                                        ItemHorzCard(
                                            title: "sgst",
                                            description:
                                                mData.deliverySgst ?? 0),
                                        ItemHorzCard(
                                            title: "Delivery Charge",
                                            description:
                                                mData.deliveryCharges ?? 0),
                                        ItemHorzCard(
                                            title: "Total",
                                            description: mData.totalprice ?? 0),
                                        const SizedBox(
                                          height: 8.0,
                                        )
                                      ]),
                                )
                              ]),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          )
                        ],
                      ),
                    ),
                    PrimaryButton(
                      btnText: "Proceed to Checkout",
                      color: colorPrimary,
                      onPressed: () async {
                        bool isLogin = SessionManager.getBool(isLoggedIn);

                        if (isLogin) {
                          navigatorPush(
                              context,
                              CheckoutScreen(
                                cartData: mData,
                              ));
                        } else {
                          var value = await customAlertDialog(
                              context: context,
                              title: "Please Login to Continue",
                              message:
                                  "Would you like to continue to login to place this order");

                          if (value == true) {
                            navigatorPush(context, const Loginpage());
                          }
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    )
                  ],
                );
              } else {
                return const EmptyView(
                  message: "No items found",
                  image: shoppingCartIcon,
                );
              }
            }),
            error: ((error, stackTrace) => ErrorView(
                  message: error.toString(),
                  onReload: () {
                    getCartData(isRefreshing: true);
                  },
                )),
            loading: (() => const Center(
                  child: CircularProgressIndicator(),
                )),
          ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget ItemHorzCard({required String title, required var description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              flex: 4,
              child: MyText(
                fontSize: 15.sp,
                text: title,
              )),
          Expanded(
              flex: 2,
              child: MyText(
                color: commonTextColor,
                text: "₹ $description",
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
              )),
        ],
      ),
    );
  }
}

class ShoppingItem extends StatelessWidget {
  final Function()? onRemoveClick;
  final Function()? onAddItemClick;
  final Function()? onRemoveItemClick;

  final CartItemData item;
  const ShoppingItem(
      {super.key,
      required this.item,
      this.onRemoveClick,
      this.onAddItemClick,
      this.onRemoveItemClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 8.0),
      child: PhysicalModel(
        borderRadius: BorderRadius.circular(8.0),
        elevation: 0.5,
        color: white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomImageView(
                cornerRadius: 8.0,
                url: item.photo ?? "",
                fallBackText: "",
                height: 20.w,
                width: 20.w,
              ),
              SizedBox(
                width: 45.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: item.name?.trim() ?? "",
                      fontSize: 15.sp,
                      color: commonTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      children: [
                        MyText(
                          textAlignment: TextAlign.start,
                          text: "${item.unitTypePrice} ₹",
                          color: commonTextColorDark,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        MyText(
                          decoration: TextDecoration.lineThrough,
                          text: "${item.unitTypeMrp} ₹",
                          color: commonTextColor,
                          fontSize: 15.sp,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: onRemoveClick,
                    icon: const Icon(Icons.delete_rounded, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 3.w,
                  ),
                  Row(
                    children: [
                      CustomAddButton(
                        onClick: onAddItemClick,
                        size: 6.w,
                        iconSize: 3.w,
                        isForAdd: true,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      MyText(
                        text: "${item.qty ?? 0}",
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      CustomAddButton(
                        onClick: onRemoveItemClick,
                        size: 6.w,
                        iconSize: 3.w,
                        isForAdd: false,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAddButton extends StatelessWidget {
  final bool isForAdd;
  final Function()? onClick;
  final double? size;
  final double? iconSize;
  const CustomAddButton(
      {Key? key, this.isForAdd = true, this.onClick, this.size, this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
          height: size ?? 40,
          width: size ?? 40,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(155, 197, 30, 1),
            border: Border.all(
              color: const Color.fromRGBO(133, 171, 17, 1),
              width: 6.0,
            ),
            borderRadius: BorderRadius.circular(size ?? 40),
          ),
          child: Center(
            child: isForAdd
                ? Icon(
                    Icons.add,
                    size: iconSize ?? 20,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.remove,
                    size: iconSize ?? 20,
                    color: Colors.white,
                  ),
          )),
    );
  }
}
