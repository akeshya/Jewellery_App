import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shopping_cart/components/image_updater.dart';
import 'package:shopping_cart/controllers/PostControllers/update_profile_controller.dart';
import 'package:shopping_cart/controllers/user_status_controller.dart';
import 'package:shopping_cart/utils/CustomColors.dart';
import 'package:shopping_cart/utils/app_colors.dart';
import 'package:shopping_cart/utils/app_images.dart';
import '../../components/common_components.dart';
import '../../components/custom_inputs_profile.dart';
import 'package:get/get.dart';

import '../../utils/CustomUtils.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final userStatusController = Get.find<UserStatusController>();

  final updateController = Get.put(UpdateProfileController());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    userStatusController.checkUserLoginStatus();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: commonBackButton(context),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: regularDarkText('My Profile', fontSize: 20),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20.0),
            child: GestureDetector(
              onTap: () async {
                print('logging out user');
                // Showing an alert dialog when a notification is received (Foreground state)
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return WillPopScope(
                      onWillPop: () async => false,
                      child: AlertDialog(
                        title: Text('Logout'),
                        content: Text('Do you really want to logout from app?'),
                        actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                userStatusController.handleLogout();
                              },
                              child: const Text('Yes'),
                            ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('No'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Card(
                  color: CustomColors.COLOR_PRIMARY_500,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: regularDarkText('Logout', color: Colors.white),
                  )),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await takePhoto('profile');
                      if (userStatusController.pickedFile.value != null) {
                        await cropImage(
                            userStatusController.pickedFile.value!, context, 'profile');
                      }
                    },
                    child: Stack(
                      children: [
                        Obx(
                          () => ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: userStatusController.profileImage.value != null
                                  ? Image.file(
                                      File(userStatusController
                                          .profileImage.value!.path),
                                      width: 125,
                                      height: 100,
                                      fit: BoxFit.fill,
                                    )
                                  : userStatusController.userImage.value ==
                                              'null' ||
                                          userStatusController.userImage.value ==
                                              'uim'
                                      ? Image.asset(AppImages.profileImage,
                                          width: 125, height: 100, fit: BoxFit.fill)
                                      : Image.network(
                                          userStatusController.userImage.value,
                                          width: 125,
                                          height: 100,
                                          fit: BoxFit.fill)),
                        ),
                        Positioned(
                            top: 0,
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: AppColors.primaryColor,
                                radius: 10,
                                child: Icon(Icons.edit, size: 10, color: Colors.white,)))
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Row(
                    children: [
                      regularDarkText('Primary Phone Number*',
                          color: Colors.black),
                    ],
                  ),
                  TextFormField(
                    style: TextStyle(color: CustomColors.COLOR_PRIMARY_500),
                    enabled: false,
                    keyboardType: TextInputType.number,
                    controller: userStatusController.phoneController.value,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.orange.shade50,
                      border: InputBorder.none, // Remove underline
                      hintText: 'Enter phone number',
                      hintStyle:
                          TextStyle(color: CustomColors.COLOR_PRIMARY_500),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: CustomColors.COLOR_PRIMARY_500,
                        size: 20,
                      ),
                      // Adjust the contentPadding to vertically align text and icons
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              CustomTextField(
                controller: userStatusController.companyNameController.value,
                enabled: updateController.isUpdating.isFalse,
                labelText: 'Company Name*',
                prefixIcon: Icons.business_center,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your company name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              CustomTextField(
                controller: userStatusController.branchNameController.value,
                enabled: updateController.isUpdating.isFalse,
                labelText: 'Branch Name',
                prefixIcon: Icons.location_city,
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 20),
              CustomTextField(
                controller: userStatusController.gstController.value,
                enabled: updateController.isUpdating.isFalse,
                labelText: 'GST Number',
                prefixIcon: Icons.numbers,
                keyboardType: TextInputType.text,
                maxLength: 15,
              ),
              SizedBox(height: 20),
              CustomTextField(
                controller: userStatusController.addressController.value,
                enabled: updateController.isUpdating.isFalse,
                labelText: 'Shipping Address*',
                prefixIcon: Icons.business,
                keyboardType: TextInputType.streetAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your shipping address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              CustomTextField(
                controller: userStatusController.personNameController.value,
                enabled: updateController.isUpdating.isFalse,
                labelText: 'Contact Person Name',
                prefixIcon: Icons.person,
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 20),
              CustomTextField(
                controller: userStatusController.emailController.value,
                enabled: updateController.isUpdating.isFalse,
                labelText: 'Email',
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              CustomTextField(
                  controller:
                      userStatusController.additionalPhoneController.value,
                  enabled: updateController.isUpdating.isFalse,
                  labelText: 'Additional Phone Number',
                  prefixIcon: Icons.call,
                  keyboardType: TextInputType.number,
                  maxLength: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
          child: GestureDetector(
            onTap: () {
              if (formKey.currentState!.validate()) {
                bool isValid = true;

                // Check if the provided GST number matches the pattern
                if(userStatusController.gstController.value.text != '') {
                  userStatusController.gstController.value.text = userStatusController.gstController.value.text.toUpperCase();
                  isValid = Utils.validateGSTNumber(userStatusController.gstController.value.text);
                }

                if(isValid) {
                  updateController.updateProfile(
                      userStatusController.companyNameController.value.text,
                      userStatusController.branchNameController.value.text,
                      userStatusController.gstController.value.text,
                      userStatusController.addressController.value.text,
                      userStatusController.personNameController.value.text,
                      userStatusController.emailController.value.text,
                      userStatusController.additionalPhoneController.value.text,
                      'uim');
                }
              }
            },
            child: Card(
              color: CustomColors.COLOR_PRIMARY_500,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              child: Center(
                child: Obx(() => updateController.isUpdating.isTrue ? CircularProgressIndicator(color: Colors.white) : regularDarkText('Save changes',
                    color: Colors.white, fontSize: 14)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}