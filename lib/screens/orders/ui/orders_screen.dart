// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jds_new/constants/app_color.dart';
import 'package:jds_new/constants/constant.dart';
import 'package:jds_new/helper/navigator_help.dart';
import 'package:jds_new/helper/session_manager.dart';
import 'package:jds_new/provider/order_notifier.dart';
import 'package:jds_new/provider/product_details_notifier.dart';
import 'package:jds_new/screens/common/ui/not_logged_screen.dart';
import 'package:jds_new/screens/orders/model/order_model_data.dart';
import 'package:jds_new/screens/orders/ui/order_description_screen.dart';
import 'package:jds_new/widget/custom_app_bar.dart';
import 'package:jds_new/widget/custom_container.dart';
import 'package:jds_new/widget/empty_view.dart';
import 'package:jds_new/widget/my_text.dart';

final productDetailsProvider =
    ChangeNotifierProvider.autoDispose<OrderNotifier>((ref) {
  return OrderNotifier();
});

class OrdersScreen extends ConsumerStatefulWidget {
  const OrdersScreen({super.key});

  @override
  ConsumerState<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends ConsumerState<OrdersScreen> {
  getCartData({
    var isRefreshing = false,
  }) async {
    ref.read(productDetailsProvider).getOrderList(
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
      appBar: const CustomAppBar(title: "My Orders"),
      body: SessionManager.getBool(isLoggedIn)
          ? (ref.watch(productDetailsProvider).orderList.when(
                data: ((data) {
                  List<OrderModelData> orderList = data;
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        ...List.generate(
                            orderList.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0),
                                  child: PhysicalModel(
                                    color: white,
                                    elevation: 0.5,
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: InkWell(
                                      onTap: () {
                                        navigatorPush(
                                            context,
                                            OrderDescriptionScreen(
                                              mData: orderList[index],
                                            ));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 14.0, vertical: 8.0),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                MyText(
                                                    fontWeight: FontWeight.w600,
                                                    text: "Order ID: " +
                                                        (orderList[index]
                                                                    .orderNo ??
                                                                0)
                                                            .toString()),
                                                const SizedBox(
                                                  height: 5.0,
                                                ),
                                                Row(
                                                  children: [
                                                    const CustomContainer(
                                                      color: colorPrimary,
                                                      height: 12.0,
                                                      width: 12.0,
                                                    ),
                                                    const SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    MyText(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        text: orderList[index]
                                                                .orderDate ??
                                                            ""),
                                                  ],
                                                )
                                              ]),
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                      ],
                    ),
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
              ))

          // EmptyView(
          //     message: "No Products Found",
          //   )
          : NotLoggedInScreen(
              callBack: (success) {},
            ),
    );
  }
}
