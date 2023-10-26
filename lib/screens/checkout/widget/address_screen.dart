// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jds_new/constants/app_color.dart';
import 'package:jds_new/constants/constant.dart';
import 'package:jds_new/repository/base_repository.dart';
import 'package:jds_new/screens/checkout/model/shipping_address.dart';
import 'package:jds_new/util/common_utils.dart';
import 'package:jds_new/util/utils.dart';
import 'package:jds_new/widget/custom_app_bar.dart';
import 'package:jds_new/widget/my_text.dart';
import 'package:jds_new/widget/primary_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../widget/primary_button.dart';

// final currentIndexNotifier = StateProvider<int>((ref) {
//   return 0;
// });

final addressLoadingProvider = StateProvider<bool>((ref) {
  return false;
});

class AddressScreen extends ConsumerStatefulWidget {
  final ShippingAddress? address;
  const AddressScreen({super.key, this.address});

  @override
  ConsumerState<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends ConsumerState<AddressScreen> {
  final _formkey = GlobalKey<FormState>();
  bool isDefault = false;
  String addressId = '';

  final TextEditingController _fulladdressController = TextEditingController();
  final TextEditingController _flatController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _societyController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  final Repository _repository = Repository();

  saveAddress() async {
    final response = await _repository.addAddress(
        address: _fulladdressController.text,
        area: _areaController.text,
        city: _cityController.text,
        landmark: _landmarkController.text,
        pincode: _pincodeController.text,
        societyName: _societyController.text,
        addressType: selectedOption.toString(),
        isDefault: isDefault ? "1" : "0",
        customerShippingAddressId: addressId,
        flat: _flatController.text);
    if (response['status'] == success) {
      Navigator.pop(context, true);
    } else {
      showSnackBar(message: response['error']);
    }
  }

  @override
  void initState() {
    setAddress();
    super.initState();
  }

  @override
  void dispose() {
    _flatController.dispose();
    _fulladdressController.dispose();
    _areaController.dispose();
    _landmarkController.dispose();
    _cityController.dispose();
    _pincodeController.dispose();
    _societyController.dispose();
    _mobileController.dispose();

    super.dispose();
  }

  setAddress() {
    if (widget.address != null) {
      var addrs = widget.address!;
      _areaController.text = addrs.area ?? "";
      _cityController.text = addrs.city ?? "";
      _flatController.text = addrs.flat ?? "";
      _fulladdressController.text = addrs.address ?? "";
      _landmarkController.text = addrs.landmark ?? "";
      //_mobileController.text=addrs.
      _societyController.text = addrs.societyName ?? "";
      _pincodeController.text = addrs.pincode ?? "";

      selectedOption = int.parse(addrs.addressType ?? "1");
      var def = addrs.isDefault ?? 0;
      addressId = addrs.customerShippingAddressId != null
          ? addrs.customerShippingAddressId.toString()
          : "";

      if (def == 1) {
        isDefault = true;
      }
      setState(() {});
    }
  }

  get clearField {
    _fulladdressController.clear();
    _flatController.clear();
    _areaController.clear();
    _landmarkController.clear();
    _cityController.clear();
    _pincodeController.clear();
    _societyController.clear();
    _mobileController.clear();
  }

  bool selectedAddress = false;
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        var isLoading = ref.read(addressLoadingProvider);
        if (isLoading == false) {
          Navigator.pop(context);
        }
        return Future.value(true);
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Edit Address",
          onBackPressed: () {
            var isLoading = ref.read(addressLoadingProvider);
            if (isLoading == false) {
              Navigator.pop(context);
            }
          },
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  // Container(
                  //   width: double.infinity,
                  //   color: colorPrimary,
                  //   child: Padding(
                  //     padding:
                  //         const EdgeInsets.only(top: 12.0, bottom: 12.0, left: 25.0),
                  //     child: MyText(
                  //         text: "Add Address",
                  //         color: white,
                  //         fontSize: 17.sp,
                  //         fontWeight: FontWeight.w600),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 15.0,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 45.w,
                        child: RadioListTile<int>(
                          title:
                              MyText(text: 'Home', fontWeight: FontWeight.w600),
                          value: 1,
                          groupValue: selectedOption,
                          onChanged: (int? value) {
                            setState(() {
                              selectedOption = value!;
                              //   print("Selected Option: $selectedOption");
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 45.w,
                        child: RadioListTile<int>(
                          title:
                              MyText(text: 'Work', fontWeight: FontWeight.w600),
                          value: 2,
                          groupValue: selectedOption,
                          onChanged: (int? value) {
                            setState(() {
                              selectedOption = value!;
                              //  print("Selected Option: $selectedOption");
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  Form(
                    key: _formkey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        PrimaryTextField(
                          isLabelReq: true,
                          backgroundColor: Colors.transparent,
                          inputType: TextInputType.number,
                          hasContentPadding: false,
                          radius: 20.0,
                          controller: _mobileController,
                          hintText: "Mobile No.",
                          validator: (str) {
                            if (str?.trim().isEmpty == true) {
                              return "Mobile No is required.";
                            } else if (!isValidPhone(str!)) {
                              return "Enter valid Mobile No";
                            } else {
                              return null;
                            }
                          },
                        ),
                        PrimaryTextField(
                                                    isLabelReq: true,

                          backgroundColor: Colors.transparent,
                          hasContentPadding: false,
                          radius: 20.0,
                          controller: _fulladdressController,
                          hintText: "Enter Adddress",
                          validator: (str) {
                            if (str?.trim().isEmpty == true) {
                              return "Address is required.";
                            } else {
                              return null;
                            }
                          },
                        ),
                        PrimaryTextField(
                                                    isLabelReq: true,

                          backgroundColor: Colors.transparent,
                          hasContentPadding: false,
                          radius: 20.0,
                          controller: _flatController,
                          hintText: "Enter flat/house No.",
                          validator: (str) {
                            if (str?.trim().isEmpty == true) {
                              return "Flat/House no is required.";
                            } else {
                              return null;
                            }
                          },
                        ),
                        PrimaryTextField(
                                                    isLabelReq: true,

                          backgroundColor: Colors.transparent,
                          hasContentPadding: false,
                          radius: 20.0,
                          controller: _areaController,
                          hintText: "Enter Area",
                          validator: (str) {
                            if (str?.trim().isEmpty == true) {
                              return "Area is required.";
                            } else {
                              return null;
                            }
                          },
                        ),
                        PrimaryTextField(
                                                    isLabelReq: true,

                          backgroundColor: Colors.transparent,
                          hasContentPadding: false,
                          radius: 20.0,
                          controller: _landmarkController,
                          hintText: "Enter Landmark ",
                          validator: (str) {
                            if (str?.trim().isEmpty == true) {
                              return "Landmark is required.";
                            } else {
                              return null;
                            }
                          },
                        ),
                        PrimaryTextField(
                                                    isLabelReq: true,

                          backgroundColor: Colors.transparent,
                          hasContentPadding: false,
                          radius: 20.0,
                          controller: _cityController,
                          hintText: "Enter city name",
                          validator: (str) {
                            if (str?.trim().isEmpty == true) {
                              return "City name is required.";
                            } else {
                              return null;
                            }
                          },
                        ),
                        PrimaryTextField(
                                                    isLabelReq: true,

                          backgroundColor: Colors.transparent,
                          inputType: TextInputType.number,
                          hasContentPadding: false,
                          radius: 20.0,
                          controller: _pincodeController,
                          hintText: "Enter pincode",
                          validator: (str) {
                            if (str?.trim().isEmpty == true) {
                              return "PinCode number is required.";
                            } else {
                              return null;
                            }
                          },
                        ),
                        PrimaryTextField(
                                                    isLabelReq: true,

                          backgroundColor: Colors.transparent,
                          hasContentPadding: false,
                          radius: 20.0,
                          controller: _societyController,
                          hintText: "Enter Society name",
                          validator: (str) {
                            if (str?.trim().isEmpty == true) {
                              return "Society name is required.";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("Set as Default"),
                      Switch(
                        value: isDefault,
                        onChanged: (value) {
                          setState(() {
                            isDefault = value;
                          });
                        },
                        activeTrackColor: Colors.redAccent[50],
                        activeColor: Colors.red,
                      ),
                    ],
                  )
                ]),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Consumer(
              builder: (context, ref, child) => PrimaryButton(
                isLoading: ref.watch(addressLoadingProvider),
                btnText: "Save",
                color: colorPrimary,
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    ref.read(addressLoadingProvider.notifier).state =
                        !ref.read(addressLoadingProvider);
                    await saveAddress();
                    ref.read(addressLoadingProvider.notifier).state =
                        !ref.read(addressLoadingProvider);
                  }
             
                },
              ),
            ),
            const SizedBox(
              height: 10.0,
            )
          ],
        ),
      ),
    );
  }
}


