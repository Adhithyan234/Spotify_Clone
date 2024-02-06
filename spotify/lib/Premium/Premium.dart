import 'package:flutter/material.dart';
import 'package:spotify/Bottomnavigation.dart';
import 'package:spotify/Premium/Widgets/Buttons.dart';
import 'package:spotify/Premium/Widgets/Premiumplan.dart';
import 'package:spotify/Premium/Widgets/cards.dart';
import 'package:spotify/Premium/Widgets/currentplan.dart';

class Premium extends StatelessWidget {
  const Premium({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(18, 18, 18, 50),
        body: ListView(
          children: [
            SizedBox(
              height: 70,
            ),
            Text(
              'Get 9 months of \n Premium for ₹ 100',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'LibreFranklin',
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            Cards(),
            Buttons(text: 'GET PREMIUM'),
            SizedBox(
              height: 10,
            ),
            Text(
              'Terms and conditions apply. Open only to users who aren\'t subscribed to a recurring Premium plan and who haven\'t purchased a 12-month one-time Premium plan at a promotional price. Offer ends 2/15/24.',
              style: TextStyle(
                  color: Color.fromRGBO(
                    184,
                    184,
                    184,
                    10,
                  ),
                  fontSize: 14),
              textAlign: TextAlign.center,
            ),
            CurrentPlan(),
            PremiumPlan()
          ],
        ),
        bottomNavigationBar: BottomBar(3),
      ),
    );
  }
}
