import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var  _razorpay = Razorpay();
  final TextEditingController amountController= TextEditingController();

 @override
 void initState() {

  _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
_razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
_razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    // TODO: implement initState
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
  // Do something when payment succeeds
}

void _handlePaymentError(PaymentFailureResponse response) {
  // Do something when payment fails
}

void _handleExternalWallet(ExternalWalletResponse response) {
  // Do something when an external wallet was selected
}
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CupertinoNavigationBar(middle: Text("Razorpay"),),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: TextField(
                controller: amountController,
                  decoration: InputDecoration(
                    hintText: "Enter your amount",
                  ), 

              ),
            ),
            CupertinoButton(
              color: Colors.grey,
              child: Text("Pay Amount")
            , onPressed: (){
              var options = {
  'key': 'rzp_test_Re0fFYbqUnRJH0',
  'amount':(int.parse(amountController.text)*100).toString(), //in the smallest currency sub-unit.
  'name': 'Aditi.',
   // Generate order_id using Orders API
  'description': 'demo',
  'timeout': 300, // in seconds
  'prefill': {
    'contact': '9123456789',
    'email': 'gaurav.kumar@example.com'
  }
};
              _razorpay.open(options);
            })
          ],
        ),

      ),
    );
    
  }
 @override 
 void dispose(){
   _razorpay.clear();
   super.dispose();
 }
}


