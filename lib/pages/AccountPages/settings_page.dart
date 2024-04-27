import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/components/common_components.dart';
import 'package:shopping_cart/components/styles.dart';
import 'package:shopping_cart/utils/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../controllers/application_controller.dart';
import '../../controllers/user_status_controller.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  final appController = Get.find<ApplicationController>();
  final userStatusController = Get.find<UserStatusController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: regularDarkText('Settings', fontSize: 20),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Obx(
                () => Center(
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed('/profile'),
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: userStatusController.userImage.value == 'null' ||
                                    userStatusController.userImage.value == 'uim'
                                ? Image.asset('images/kljewels.png',
                                    width: 125, height: 100, fit: BoxFit.fill)
                                : Image.network(userStatusController.userImage.value,
                                    width: 125, height: 100, fit: BoxFit.fill)),
                        SizedBox(height: 5),
                        Text('View Profile', style: poppinsBold.copyWith(color: AppColors.primaryColor500),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('images/noti.png', width: 36, height: 36),
                      SizedBox(width: 10),
                      regularDarkText('Notifications',
                          fontSize: 14, color: Color(0xFF171A1F)),
                    ],
                  ),
                  Obx(
                    () => Switch(
                      value: appController.notificationEnabled.value,
                      onChanged: (val) =>
                          appController.enableNotifications(val),
                      activeColor: Color(0xFFCC7B25),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  regularDarkText('ACCOUNT SETTINGS',
                      color: Color(0xFF9095A1), fontSize: 11),
                ],
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed('/tnc'),
                child: Card(
                  // elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('images/settings/security.png',
                              width: 36, height: 36),
                          SizedBox(width: 16),
                          regularDarkText('Security',
                              color: Color(0xFF171A1F), fontSize: 14),
                        ],
                      ),
                      Image.asset('images/settings/shield2.png',
                          width: 24, height: 24),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed('/privacy'),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('images/settings/privacy.png',
                              width: 36, height: 36),
                          SizedBox(width: 16),
                          regularDarkText('Privacy',
                              color: Color(0xFF171A1F), fontSize: 14),
                        ],
                      ),
                      Image.asset('images/settings/warning.png',
                          width: 24, height: 24),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed('/notifications'),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('images/settings/noti.png',
                              width: 36, height: 36),
                          SizedBox(width: 16),
                          regularDarkText('Notification',
                              color: Color(0xFF171A1F), fontSize: 14),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('images/settings/update.png',
                            width: 36, height: 36),
                        SizedBox(width: 16),
                        regularDarkText('App Updates',
                            color: Color(0xFF171A1F), fontSize: 14),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed('/support'),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('images/settings/help.png',
                              width: 36, height: 36),
                          SizedBox(width: 16),
                          regularDarkText('Help & Support',
                              color: Color(0xFF171A1F), fontSize: 14),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed('/wishlist'),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('images/settings/wish.png',
                              width: 36, height: 36),
                          SizedBox(width: 16),
                          regularDarkText('Wishlist',
                              color: Color(0xFF171A1F), fontSize: 14),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed('/orders'),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('images/settings/orders.png',
                              width: 36, height: 36),
                          SizedBox(width: 16),
                          regularDarkText('My Orders',
                              color: Color(0xFF171A1F), fontSize: 14),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed('/custom_order'),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('images/settings/orders.png',
                              height: 36, width: 36),
                          SizedBox(width: 20),
                          regularDarkText('Custom order',
                              color: Color(0xFF171A1F), fontSize: 14)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  regularDarkText('Contact Us',
                      color: Color(0xFF171A1F), fontSize: 20),
                ],
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  const url =
                      "https://www.instagram.com/shreesouthindiajewellers/?igshid=YWYwM2I1ZDdmOQ%3D%3D";
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw "Could not launch the url";
                  }
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.video_camera_back_sharp,
                                color: Color(0xFFCC7B25), size: 16),
                            SizedBox(width: 16),
                            regularDarkText('shreesouthindiajewellers',
                                color: Color(0xFF171A1F), fontSize: 14),
                          ],
                        ),
                        Row(
                          children: [
                            regularDarkText('Follow',
                                color: Color(0xFF9095A1), fontSize: 14),
                            SizedBox(width: 10),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Color(0xFF9095A1),
                              size: 16,
                              weight: 500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  String telurl = "tel:8886081135";
                  if (await canLaunchUrlString(telurl)) {
                    launchUrlString(telurl);
                  } else
                    ("Can't Lunch $telurl");
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.call,
                                color: Color(0xFFCC7B25), size: 16),
                            SizedBox(width: 16),
                            regularDarkText('+91 888 608 1135',
                                color: Color(0xFF171A1F), fontSize: 14),
                          ],
                        ),
                        Row(
                          children: [
                            regularDarkText('Call',
                                color: Color(0xFF9095A1), fontSize: 14),
                            SizedBox(width: 10),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Color(0xFF9095A1),
                              size: 16,
                              weight: 500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  final Uri _emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'help@ssij.in',
                    queryParameters: {
                      'subject': 'Product',
                      'body': 'Jawellers',
                    },
                  );

                  final String _emailLaunchUriString =
                      _emailLaunchUri.toString();

                  if (await canLaunch(_emailLaunchUriString)) {
                    await launch(_emailLaunchUriString);
                  } else {
                    print("Can't launch email");
                  }
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.email,
                                color: Color(0xFFCC7B25), size: 16),
                            SizedBox(width: 16),
                            regularDarkText('help@ssij.in',
                                color: Color(0xFF171A1F), fontSize: 14),
                          ],
                        ),
                        Row(
                          children: [
                            regularDarkText('Send Email',
                                color: Color(0xFF9095A1), fontSize: 14),
                            SizedBox(width: 10),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Color(0xFF9095A1),
                              size: 16,
                              weight: 500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  const url = "https://wa.me/918886081135?text=Hello%20Sir";
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw "Could not launch the url";
                  }
                },
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.whatshot,
                                color: Color(0xFFCC7B25), size: 16),
                            SizedBox(width: 16),
                            regularDarkText('WhatsApp',
                                color: Color(0xFF171A1F), fontSize: 14),
                          ],
                        ),
                        Row(
                          children: [
                            regularDarkText('Chat',
                                color: Color(0xFF9095A1), fontSize: 14),
                            SizedBox(width: 10),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Color(0xFF9095A1),
                              size: 16,
                              weight: 500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
