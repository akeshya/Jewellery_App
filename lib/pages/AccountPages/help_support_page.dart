import 'package:flutter/material.dart';

import '../../components/common_components.dart';

class HelpSupportPage extends StatefulWidget {

  @override
  State<HelpSupportPage> createState() => _HelpSupportPageState();
}

class _HelpSupportPageState extends State<HelpSupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: commonBackButton(context),
        ),
        title: regularDarkText('Help & Support', fontSize: 20),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          // commonSearchBar(context, 'Describe your issue', 8, Colors.transparent, Color(0xFFF3F4F6)),

          SizedBox(height: 40),
          Row(
            children: [
              regularDarkText('Popular', color: Color(0xFF171A1F), fontSize: 14),
            ],
          ),
          SizedBox(height: 40),

          Row(
            children: [
              regularDarkText('Change or add an email address', fontSize: 14),
            ],
          ),
          SizedBox(height: 40),

          Row(
            children: [
              regularDarkText('Close your account', fontSize: 14),
            ],
          ),
          SizedBox(height: 80),

          SizedBox(height: 40),
          Row(
            children: [
              regularDarkText('Recommended topics', color: Color(0xFF171A1F), fontSize: 14),
            ],
          ),
          SizedBox(height: 40),

          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: Color(0xFFDEE1E6),
                width: 1,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Image.asset('images/support/light.png', color: Color(0xFFCC7B25), height: 24, width: 24,),
                        SizedBox(width: 20),
                        regularDarkText('Profile', color: Color(0xFF171A1F), fontSize: 14)
                      ],),

                        Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 36)
                    ],),
                ),

                commonHorizontalLine(),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Image.asset('images/support/shield.png', color: Color(0xFFCC7B25), height: 24, width: 24,),
                        SizedBox(width: 20),
                        regularDarkText('Data and Privacy', color: Color(0xFF171A1F), fontSize: 14)
                      ],),

                      Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 36)
                    ],),
                ),

                commonHorizontalLine(),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Image.asset('images/support/bell.png', color: Color(0xFFCC7B25), height: 24, width: 24,),
                        SizedBox(width: 20),
                        regularDarkText('Notification', color: Color(0xFF171A1F), fontSize: 14)
                      ],),

                      Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 36)
                    ],),
                ),

                SizedBox(height: 50),
                commonHorizontalLine(),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 36)
                    ],),
                ),
              ],),
            ),
          )
        ],),
      ),
    );
  }
}