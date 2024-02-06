import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Buttons extends StatefulWidget {
  const Buttons({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  late Razorpay _razorpay;

  @override
  void initState() {
    _razorpay= Razorpay();
    super.initState();
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
  void openCheckout() async {
    try {
      _razorpay.open({
        'name': 'Spotify premium',
        'key': 'rzp_live_ILgsfZCZoFIKMB',
        'amount': 100,
        'description':'General',
        'retry' : {'enabled':true,'max_count':1},
        'send_sms_hash':true,
        'prefill':{'contact':'9123104356','email': 'me@Spotify.com'},
        'external':{
          'wallets': ['paytm']
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
        child: TextButton(
          onPressed:openCheckout,
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Text(
              widget.text,
              style: TextStyle(
                  color: Colors.black, fontSize: 16, letterSpacing: 2),
            ),
          ),
        ),
      ),
    );
  }
}
