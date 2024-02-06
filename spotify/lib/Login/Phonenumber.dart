import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotify/Login/verification.dart';

class PhoneNumber extends StatefulWidget {
  static late String verificationID;

  const PhoneNumber({super.key});

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

TextEditingController Number = TextEditingController();

final FirebaseAuth auth = FirebaseAuth.instance;

class _PhoneNumberState extends State<PhoneNumber> {
  void otp() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String number = Number.text;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91$number',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? forceResendingToken) async {
        PhoneNumber.verificationID = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) async {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: double.infinity,
          width: 500,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 35,
                    )),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Enter phone number',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 40,
                        child: Text(
                          '+91',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '|',
                        style: TextStyle(fontSize: 33, color: Colors.white),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: TextField(
                        controller: Number,
                        onChanged: (value) {
                          // Trigger a rebuild to update button color
                          setState(() {});
                        },
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        keyboardType: TextInputType.number,
                        maxLines: 10,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Phone number',
                            hintStyle: TextStyle(color: Colors.grey)),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'We will send you a code by SMS to confirm your phone number.',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: TextButton(
                      onPressed: () {
                        otp();
                        String num = Number.text;
                        if (num.length == 10) {
                          print('Valid phone number: $num');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Verification(),
                              ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Enter a valid 10-digit number')));
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Number.text.isEmpty ? Colors.grey : Colors.white,
                        ),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 25),
                        child: Text(
                          'Next',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              letterSpacing: 2),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
