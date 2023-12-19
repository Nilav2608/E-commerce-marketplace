import 'package:flutter/material.dart';
import 'package:fluxestore/models/DelivaryAddressModel.dart';
import 'package:fluxestore/models/MyOrdersDataModel.dart';
import 'package:fluxestore/presentation/pages/checkout/PaymentSection.view.dart';
import 'package:fluxestore/presentation/pages/checkout/ShippingAddressSection.view.dart';
// ignore: depend_on_referenced_packages
import 'package:lottie/lottie.dart';
import '../../../Business_Logic/CheckOutPageBloc/check_out_page_bloc.dart';
import 'ChekoutStatusItemsView.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutPage extends StatefulWidget {
  final MyOrdersDataModel myOrdersData;
  const CheckOutPage({super.key, required this.myOrdersData});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

final PageController pageController = PageController();

class _CheckOutPageState extends State<CheckOutPage> {
  final CheckOutPageBloc checkOutPageBloc = CheckOutPageBloc();
  @override
  void initState() {
    checkOutPageBloc.add(CheckOutInitialEvent());
    super.initState();
  }

  onChanged(bool? value) {
    setState(() {
      agreedToTermsAndConditions = !agreedToTermsAndConditions;
    });
  }

  bool agreedToTermsAndConditions = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Check Out",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Builder(builder: (context) {
              return BlocConsumer<CheckOutPageBloc, CheckOutPageState>(
                listenWhen: (previous, current) =>
                    current is CheckOutPageActionState,
                buildWhen: (previous, current) =>
                    current is CheckOutPageActionState,
                bloc: checkOutPageBloc,
                listener: (context, state) {
                  switch (state.runtimeType) {
                    case NavigateTohomePageActionState:
                      Navigator.popAndPushNamed(context, '/');
                  }
                },
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case PageLoadingState:
                      return const AlertDialog(
                            content: CircularProgressIndicator(),
                          );

                    case CheckOutPageBlocInitialState:
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ChekoutStatusItemsView(
                            initState: true,
                            shippingAddressState: false,
                            paymentState: false,
                            completedState: false,
                          ),
                          ShippingAddressSection(
                            onPressed: (DeliveryAddress deliveryAddress) {
                              if (formKey.currentState!.validate()) {
                                checkOutPageBloc.add(CheckOutPagePaymentEvent(
                                     
                                    subTotal: widget.myOrdersData.subTotal!, addressData: deliveryAddress));
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Submitting form")));
                              }
                            },
                          )
                        ],
                      );
                    case PaymentPageActionState:
                      final  successData =
                          state as PaymentPageActionState;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ChekoutStatusItemsView(
                            initState: true,
                            shippingAddressState: true,
                            paymentState: true,
                            completedState: false,
                          ),
                          PaymentSectionView(
                            subTotal: successData.subTotal,
                            onChanged: (agreedToTermsAndConditions) {
                              onChanged(agreedToTermsAndConditions);
                            },
                            agreedToTermsAndConditions:
                                agreedToTermsAndConditions,
                            onProceedToCheckOut: () {
                              if (agreedToTermsAndConditions) {
                                checkOutPageBloc.add(
                                    CheckOutPagePlaceOrderEvent(
                                       
                                        dataModel: widget.myOrdersData, addressData: successData.address));
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Color(0xFFFF8080),
                                        content: Text(
                                          "Please verify terms and conditions to proceed!",
                                          style: TextStyle(color: Colors.white),
                                        )));
                              }
                            },
                          )

                          // Positioned(
                          //   left: 0,
                          //   right: 0,
                          //   bottom: 0,
                          //   height: 80, // Height of the bottom container
                          //   child: Container(
                          //     height: 300,
                          //     color: Colors.blue, // Example background color
                          //     child: Column(
                          //       mainAxisAlignment:
                          //           MainAxisAlignment.spaceAround,
                          //       children: [
                          //         IconButton(
                          //           icon: Icon(Icons.home),
                          //           onPressed: () {
                          //             // Handle button tap
                          //           },
                          //         ),
                          //         IconButton(
                          //           icon: Icon(Icons.settings),
                          //           onPressed: () {
                          //             // Handle button tap
                          //           },
                          //         ),
                          //         IconButton(
                          //           icon: Icon(Icons.person),
                          //           onPressed: () {
                          //             // Handle button tap
                          //           },
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),

                          // ignore: prefer_const_constructors
                        ],
                      );
                    case PaymentCompletedActionState:
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ChekoutStatusItemsView(
                            initState: true,
                            shippingAddressState: true,
                            paymentState: true,
                            completedState: true,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Order Completed",
                                    style: TextStyle(
                                        color: Color(0xff1D1F22),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700)),
                                const SizedBox(
                                  height: 50,
                                ),
                                Center(
                                  child: Lottie.asset(
                                      "assets/lottie/completed_lottie.json",
                                      width: 200,
                                      height: 200,
                                      repeat: false),
                                ),
                                const Center(
                                  child: SizedBox(
                                    height: 75,
                                    width: 272,
                                    child: Text(
                                        "Thank you for your purchase!, You can view your order in ‘My Orders’ section.",
                                        style: TextStyle(
                                            color: Color(0xff1D1F22),
                                            fontSize: 14,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                SizedBox(
                                  height: 48,
                                  width: 315,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        checkOutPageBloc
                                            .add(NavigateBackToHomePageEvent());
                                      },
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color(0xFF343434))),
                                      child: const Text(
                                        "Continue shopping",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      )),
                                )
                              ],
                            ),
                          )
                        ],
                      );

                    default:
                      return const SizedBox();
                  }
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
