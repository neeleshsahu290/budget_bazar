import 'package:flutter/material.dart';
import 'package:jds_new/constants/app_color.dart';
import 'package:jds_new/screens/orders/model/order_model_data.dart';
import 'package:jds_new/screens/orders/model/products_list_arr.dart';
import 'package:jds_new/widget/custom_app_bar.dart';
import 'package:jds_new/widget/custom_container.dart';
import 'package:jds_new/widget/custom_image_view.dart';
import 'package:jds_new/widget/my_text.dart';
import 'package:jds_new/widget/primary_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderDescriptionScreen extends StatelessWidget {
  final OrderModelData mData;

  const OrderDescriptionScreen({super.key, required this.mData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Order Description",
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 15.0,
          ),
          PhysicalModel(
            color: white,
            elevation: 0.5,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        fontSize: 15.sp,
                        text: "Order ID : ${mData.orderNo ?? ""}",
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          const CustomContainer(
                            color: colorPrimary,
                            height: 10.0,
                            width: 10.0,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          MyText(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              text: "order at ${mData.orderDate ?? ""}"),
                        ],
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        children: [
                          PrimaryButton(
                            width: 43.w,
                            textSize: 15.sp,
                            hasBorder: true,
                            borderColor: colorPrimary,
                            textColor: colorPrimary,
                            disablePadding: true,
                            color: white,
                            btnText: "Download Invoice",
                          ),
                        ],
                      )
                    ]),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          mData.productsListArr != null && mData.productsListArr!.isNotEmpty
              ? Wrap(
                  children: List.generate(
                      mData.productsListArr!.length,
                      (index) => OrderDescItem(
                            item: mData.productsListArr![index],
                          )))
              : const SizedBox.shrink(),
          const SizedBox(
            height: 8.0,
          ),
          PhysicalModel(
            color: white,
            elevation: 0.5,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 6.0,
                      ),
                      MyText(
                        text: "Customer",
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      MyText(
                        text: "Mobile Number",
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      MyText(
                        text: mData.customerMobileno ?? "",
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      MyText(
                        text: "Shipping Address",
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      MyText(
                        text: mData.customerShippingAddress ?? "",
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                      ),
                      const SizedBox(
                        height: 8.0,
                      )
                    ]),
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          PhysicalModel(
            color: white,
            elevation: 0.5,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 6.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                child: MyText(
                  text: "Payment Summary",
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              itemHorzCard(
                  title: "Sub Total", description: mData.subtotal ?? 0),

              Divider(
                thickness: 0.2,
                height: 5.0,
                color: Colors.grey.shade600,
              ),
              const SizedBox(
                height: 5.0,
              ),
              // ItemHorzCard(
              //     title: "cgst",
              //     description:
              //         mData.deliveryCgst ?? 0),
              // ItemHorzCard(
              //     title: "sgst",
              //     description:
              //         mData.deliverySgst ?? 0),
              itemHorzCard(title: "Tax", description: mData.taxAmount ?? 0),
              const SizedBox(
                height: 6.0,
              ),
              itemHorzCard(
                  title: "Delivery Charge",
                  description: mData.deliveryCharges ?? 0),
              const SizedBox(
                height: 8.0,
              ),

              Divider(
                thickness: 0.2,
                height: 5.0,
                color: Colors.grey.shade600,
              ),
              const SizedBox(
                height: 8.0,
              ),

              itemHorzCard(
                  title: "Total Payment Amount",
                  description: mData.total ?? 0,
                  titleFontWeight: FontWeight.w600),
              const SizedBox(
                height: 8.0,
              )
            ]),
          ),
          const SizedBox(
            height: 15.0,
          ),
        ]),
      ),
    );
  }

  Widget itemHorzCard(
      {required String title,
      required var description,
      FontWeight? titleFontWeight}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              flex: 4,
              child: MyText(
                fontWeight: titleFontWeight ?? FontWeight.w500,
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

class OrderDescItem extends StatelessWidget {
  final ProductsListArr item;
  const OrderDescItem({
    super.key,
    required this.item,
  });

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
                url: item.productPhoto ?? "",
                fallBackText: "",
                height: 20.w,
                width: 20.w,
              ),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: item.productName?.trim() ?? "",
                      fontSize: 15.sp,
                      color: commonTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    MyText(
                      text: "Quantity: ${item.productQty?.trim() ?? ""}",
                      fontSize: 15.sp,
                      color: commonTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    MyText(
                      text: "Status: ${item.orderStatusText?.trim() ?? ""}",
                      fontSize: 15.sp,
                      color: commonTextColorDark,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    MyText(
                      textAlignment: TextAlign.start,
                      text: "${item.productPrice} ₹",
                      color: commonTextColorDark,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
