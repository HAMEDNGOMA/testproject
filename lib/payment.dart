import 'package:flutter/material.dart';
import 'package:moamalat_payment/moamalat_payment.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int? amount = 1000;
  TextEditingController amoutController = TextEditingController();
  InputDecoration inputDecoration = const InputDecoration(
    hintText: "amount",
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: amount == null
          ? const Center(child: CircularProgressIndicator())
          : MoamalatPayment(
              isTest: true,
              merchantId: "10081014649",
              merchantReference: "PS_Merchant",
              terminalId: "99179395",
              amount: "${amount}",
              merchantSecretKey:
                  "39636630633731362D663963322D346362642D386531662D633963303432353936373431",
              onCompleteSucsses: (value) {
                print(value.payerName);
              },
              onError: (error) {
                print(error.secureHash);
              }),
    );
  }
}
