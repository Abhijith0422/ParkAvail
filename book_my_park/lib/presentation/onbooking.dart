import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_my_park/application/bloc/parkdata_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:upi_india/upi_india.dart';

final ValueNotifier<bool> paymentSuccessNotifier = ValueNotifier<bool>(false);

class BookingPage extends StatelessWidget {
  final int index;
  const BookingPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<ParkdataBloc>(context).add(const ParkdataEvent.getdata());
    });
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'ParkAvail',
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: BlocBuilder<ParkdataBloc, ParkdataState>(
        builder: (context, state) {
          return Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Review Booking",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
                child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey),
                        color: Colors.transparent),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "${state.parkdata[index].image}"),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                            child: Column(
                              children: [
                                AutoSizeText(
                                  "${state.parkdata[index].name}",
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 3,
                                  minFontSize: 16,
                                ),
                                const SizedBox(height: 10),
                                Text("Price: ${state.parkdata[index].price}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    )),
                                const SizedBox(height: 10),
                                const Text("Duration: 1 hour",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    )),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Amount Payable",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey),
                      color: Colors.transparent),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Text("Amount : ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Text("${state.parkdata[index].price}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Text("Convenience Fee : ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Text(" 10",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Text("Total : ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Text("${state.parkdata[index].price! + 10}",
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                        color: Colors.green),
                    child: TextButton(
                        onPressed: () {
                          initiateUpiPayment(
                              (state.parkdata[index].price!.toDouble() + 10));
                        },
                        child: const Text(
                          "Proceed to Payement",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ))),
              )
            ],
          );
        },
      ),
      backgroundColor: const Color.fromARGB(255, 23, 31, 43),
    );
  }
}

Future<void> initiateUpiPayment(double amount) async {
  UpiIndia upiIndia = UpiIndia();
  String transactionRef = DateTime.now().millisecondsSinceEpoch.toString();

  UpiResponse response = await upiIndia.startTransaction(
    // UPI app to be used
    receiverUpiId: '9188810679@apl', // UPI ID of the receiver
    receiverName: 'ParkAvail',
    transactionRefId: transactionRef,
    transactionNote: 'Payment for parking slot',
    amount: amount, app: UpiApp.googlePay, // Amount to be paid
  );

  switch (response.status) {
    case UpiPaymentStatus.SUCCESS:
      paymentSuccessNotifier.value = true;
      print('Transaction successful');

      break;
    case UpiPaymentStatus.SUBMITTED:
      print('Transaction submitted');
      paymentSuccessNotifier.value = true;
      break;
    case UpiPaymentStatus.FAILURE:
      print('Transaction failed');
      break;
    default:
      print('Unknown status: ${response.status}');
  }
}
