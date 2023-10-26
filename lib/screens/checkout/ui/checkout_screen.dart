// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jds_new/constants/app_color.dart';
import 'package:jds_new/helper/navigator_help.dart';
import 'package:jds_new/provider/checkout_notifier.dart';
import 'package:jds_new/screens/checkout/model/user_details_model.dart';
import 'package:jds_new/screens/checkout/ui/success_booking.dart';
import 'package:jds_new/screens/checkout/widget/address_screen.dart';
import 'package:jds_new/screens/shopping_cart/model/cart_data.dart';
import 'package:jds_new/widget/custom_app_bar.dart';
import 'package:jds_new/widget/empty_view.dart';
import 'package:jds_new/widget/my_text.dart';
import 'package:jds_new/widget/primary_button.dart';
import 'package:jds_new/widget/progress_dilog.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final checkoutProvider =
    ChangeNotifierProvider.autoDispose<CheckoutNotifier>((ref) {
  return CheckoutNotifier();
});
final checkoutLoadingProvider = StateProvider<bool>((ref) {
  return false;
});

class CheckoutScreen extends ConsumerStatefulWidget {
  final CartData cartData;
  const CheckoutScreen({super.key, required this.cartData});

  @override
  ConsumerState<CheckoutScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends ConsumerState<CheckoutScreen> {
  getCartData({
    var isRefreshing = false,
  }) async {
    ref.read(checkoutProvider).getUserDetails(
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
        title: "Checkout Screen",
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: ref.watch(checkoutProvider).userData.when(
            data: ((data) {
              UserDetailsModel mData = data;
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        PhysicalModel(
                          color: white,
                          elevation: 0.5,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 4.0),
                                  child: MyText(
                                    text: "Select Address",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Divider(
                                  thickness: 0.2,
                                  height: 5.0,
                                  color: Colors.grey.shade600,
                                ),
                                mData.shippingAddress != null &&
                                        mData.shippingAddress!.isNotEmpty
                                    ? Wrap(
                                        children: List.generate(
                                            mData.shippingAddress!.length,
                                            (index) {
                                        var addrsItem =
                                            mData.shippingAddress![index];
                                        return Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12.0,
                                                      vertical: 8.0),
                                              child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    //   CustomContainer(hasBorder: ,)
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          MyText(
                                                              fontSize: 15.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color:
                                                                  commonTextColorDark,
                                                              text: addrsItem
                                                                      .addressTypeName ??
                                                                  ""),
                                                          MyText(
                                                              fontSize: 15.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  commonTextColor,
                                                              text: addrsItem
                                                                      .address ??
                                                                  "")
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 8.0,
                                                    ),

                                                    PopupMenuButton(
                                                      onSelected:
                                                          (value) async {
                                                        if (value == "1") {
                                                          var req =
                                                              await navigatorPush(
                                                                  context,
                                                                  AddressScreen(
                                                                    address:
                                                                        addrsItem,
                                                                  ));
                                                          if (req != null &&
                                                              req == true) {
                                                            progressDialog(
                                                                context,
                                                                text:
                                                                    "Loading...");
                                                            await getCartData();
                                                            Navigator.pop(
                                                                context);
                                                          }
                                                        } else if (value ==
                                                            "2") {
                                                          progressDialog(
                                                              context,
                                                              text:
                                                                  "Deleting...");
                                                          await ref
                                                              .read(
                                                                  checkoutProvider)
                                                              .deleteAddress(
                                                                  addrsItem
                                                                      .customerShippingAddressId);
                                                          Navigator.pop(
                                                              context);
                                                        }
                                                      },
                                                      itemBuilder:
                                                          (BuildContext bc) {
                                                        return [
                                                          PopupMenuItem(
                                                            value: '1',
                                                            child: menuBar(
                                                                icon:
                                                                    Icons.edit,
                                                                title: "Edit"),
                                                          ),
                                                          PopupMenuItem(
                                                            value: '2',
                                                            child: menuBar(
                                                                icon: Icons
                                                                    .delete,
                                                                title:
                                                                    "Delete"),
                                                          ),
                                                        ];
                                                      },
                                                    ),
                                                  ]),
                                            ),
                                            Divider(
                                              thickness: 0.2,
                                              height: 0.2,
                                              color: Colors.grey.shade600,
                                            ),
                                          ],
                                        );
                                      }))
                                    : const SizedBox.shrink(),
                                PrimaryButton(
                                  disablePadding: true,
                                  width: double.infinity,
                                  color: white,
                                  onPressed: () async {
                                    var req = await navigatorPush(
                                        context, const AddressScreen());
                                    if (req != null && req == true) {
                                      progressDialog(context,
                                          text: "Loading...");
                                      await getCartData();
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 8.0),
                                    child: MyText(
                                      text: "Add New Address",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        ref.watch(checkoutProvider).isAddreq
                            ? Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 4.0),
                                  child: MyText(
                                      text: "Address is required",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: redColor),
                                ),
                              )
                            : const SizedBox.shrink(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        PhysicalModel(
                          color: white,
                          elevation: 0.5,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 4.0),
                                  child: MyText(
                                    text: "Payment Summary",
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
                                    description: widget.cartData.subtotal ?? 0),
                                ItemHorzCard(
                                    title: "cgst",
                                    description:
                                        widget.cartData.deliveryCgst ?? 0),
                                ItemHorzCard(
                                    title: "sgst",
                                    description:
                                        widget.cartData.deliverySgst ?? 0),
                                ItemHorzCard(
                                    title: "Delivery Charge",
                                    description:
                                        widget.cartData.deliveryCharges ?? 0),
                                ItemHorzCard(
                                    title: "Total",
                                    description:
                                        widget.cartData.totalprice ?? 0),
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
                  ),
                  PrimaryButton(
                    isLoading: ref.watch(checkoutLoadingProvider),
                    btnText: "Confirm Order",
                    color: colorPrimary,
                    onPressed: () async {
                      if (mData.shippingAddress != null &&
                          mData.shippingAddress!.isNotEmpty) {
                        ref.read(checkoutLoadingProvider.notifier).state =
                            !ref.read(checkoutLoadingProvider);

                        var response =
                            await ref.read(checkoutProvider).checkoutOrder();
                        ref.read(checkoutLoadingProvider.notifier).state =
                            !ref.read(checkoutLoadingProvider);
                        if (response == true) {
                          navigatorPush(context, const SuccessBooking());
                        }
                      } else {
                        ref.read(checkoutProvider).updateAddressReq(true);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  )
                ],
              );
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

  Widget menuBar({required IconData icon, required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            icon,
            size: 20.0,
            color: commonTextColor,
          ),
          const SizedBox(
            width: 20.0,
          ),
          MyText(
            color: commonTextColor,
            text: title,
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
          ),
        ],
      ),
    );
  }
}
