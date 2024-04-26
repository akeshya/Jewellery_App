import 'package:flutter/material.dart';
import 'package:shopping_cart/components/common_components.dart';
import 'package:shopping_cart/components/custom_toast.dart';
import 'package:shopping_cart/components/input_component.dart';
import 'package:shopping_cart/controllers/PostControllers/login_register_controller.dart';
import 'package:shopping_cart/utils/CustomUtils.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/utils/app_colors.dart';
import 'package:shopping_cart/utils/app_images.dart';

import '../../utils/app_constants.dart';
import '../../utils/get_storage.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final registerController = Get.put(LoginRegisterController());

  final _formKey = GlobalKey<FormState>();

  final primaryPhoneController = TextEditingController();
  final companyNameController = TextEditingController();
  final branchNameController = TextEditingController();
  final gstNumberController = TextEditingController();
  final shippingAddressController = TextEditingController();
  final contactPersonController = TextEditingController();
  final contactEmailController = TextEditingController();
  final additionalPhoneController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 16.0, left: 16.0, right: 16.0, bottom: 0.0),
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      regularDarkText('Welcome.',
                          fontSize: 32, color: Color(0xFF171A1F)),
                      regularDarkText('Create an account',
                          fontSize: 20, color: Color(0xFF9095A1))
                    ],
                  ),
                  Card(
                    elevation: 5,
                    child: Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppImages.appIcon),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    CustomTextInput(
                      topLabel: 'Primary Phone Number*',
                      label: 'Enter Phone Number',
                      isEditable: !_isLoading,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      controller: primaryPhoneController,
                      prefixIcon:
                          Icon(Icons.phone, color: AppColors.primaryColor500),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 10) {
                          return 'Please enter 10 digits phone number';
                        } else if (!Utils.isNumeric(value))
                          return 'Phone number should be only digits';
                        else
                          return null;
                      },
                    ),
                    CustomTextInput(
                      topLabel: 'Company Name*',
                      label: 'Enter Company Name',
                      isEditable: !_isLoading,
                      keyboardType: TextInputType.name,
                      controller: companyNameController,
                      prefixIcon: Icon(Icons.business,
                          color: AppColors.primaryColor500),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your company name';
                        }
                        return null;
                      },
                    ),
                    CustomTextInput(
                      topLabel: 'Branch Name',
                      label: 'Enter Branch Name',
                      isEditable: !_isLoading,
                      keyboardType: TextInputType.name,
                      controller: branchNameController,
                      prefixIcon: Icon(Icons.business_center,
                          color: AppColors.primaryColor500),
                    ),
                    CustomTextInput(
                      topLabel: 'GST Number',
                      label: 'Enter GST Number',
                      isEditable: !_isLoading,
                      keyboardType: TextInputType.text,
                      controller: gstNumberController,
                      maxLength: 15,
                      prefixIcon:
                          Icon(Icons.numbers, color: AppColors.primaryColor500),
                    ),
                    CustomTextInput(
                      topLabel: 'Shipping Address*',
                      label: 'Enter Shipping Address',
                      isEditable: !_isLoading,
                      keyboardType: TextInputType.streetAddress,
                      controller: shippingAddressController,
                      prefixIcon: Icon(Icons.location_city,
                          color: AppColors.primaryColor500),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your shipping address';
                        }
                        return null;
                      },
                    ),
                    CustomTextInput(
                      topLabel: 'Contact Person Name',
                      label: 'Enter Manager Name',
                      isEditable: !_isLoading,
                      keyboardType: TextInputType.name,
                      controller: contactPersonController,
                      prefixIcon:
                          Icon(Icons.person, color: AppColors.primaryColor500),
                    ),
                    CustomTextInput(
                      topLabel: 'Email',
                      label: 'Enter Email',
                      isEditable: !_isLoading,
                      keyboardType: TextInputType.emailAddress,
                      controller: contactEmailController,
                      prefixIcon:
                          Icon(Icons.email, color: AppColors.primaryColor500),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return null;
                        } else {
                          return Utils.isValidEmail(value)
                              ? null
                              : 'Invalid email address';
                        }
                      },
                    ),
                    CustomTextInput(
                      topLabel: 'Additional Phone Numbers',
                      label: 'Enter Phone Number',
                      isEditable: !_isLoading,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      controller: additionalPhoneController,
                      prefixIcon:
                          Icon(Icons.phone, color: AppColors.primaryColor500),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return null;
                        } else if (value.length < 10) {
                          return 'Please enter 10 digits phone number';
                        } else if (!Utils.isNumeric(value))
                          return 'Phone number should be only digits';
                        else
                          return null;
                      },
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                        value: registerController.pvcChecked.value,
                        fillColor:
                            MaterialStateProperty.resolveWith((Set states) {
                          if (states.contains(MaterialState.disabled)) {
                            return AppColors.primaryColor500.withOpacity(.32);
                          }
                          return AppColors.primaryColor500;
                        }),
                        checkColor: Color(0xFFFFFFFF),
                        onChanged: (val) =>
                            registerController.pvcChecked.value = val!),
                  ),
                  regularDarkText('I agree with ',
                      fontSize: 14, color: Color(0xFF171A1F)),
                  GestureDetector(
                      onTap: () => Get.toNamed('/privacy_policy'),
                      child: regularDarkText('Privacy Policy',
                          fontSize: 14, color: AppColors.primaryColor500)),
                ],
              ),
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                        value: registerController.tncChecked.value,
                        fillColor:
                            MaterialStateProperty.resolveWith((Set states) {
                          if (states.contains(MaterialState.disabled)) {
                            return AppColors.primaryColor500.withOpacity(.32);
                          }
                          return AppColors.primaryColor500;
                        }),
                        checkColor: Color(0xFFFFFFFF),
                        onChanged: (val) =>
                            registerController.tncChecked.value = val!),
                  ),
                  regularDarkText('I agree with ',
                      fontSize: 14, color: Color(0xFF171A1F)),
                  GestureDetector(
                      onTap: () => Get.toNamed('/terms_conditions'),
                      child: regularDarkText('Terms & Conditions',
                          fontSize: 14, color: AppColors.primaryColor500)),
                ],
              ),
              GestureDetector(
                onTap: () => Get.offAllNamed('/login'),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (registerController.pvcChecked.isFalse) {
                        Toast.error('Please check agree with privacy policy.');
                      } else if (registerController.tncChecked.isFalse) {
                        Toast.error(
                            'Please check agree with terms & conditions.');
                      } else if (_formKey.currentState!.validate()) {
                        bool isValid = true;

                        // Check if the provided GST number matches the pattern
                        if (gstNumberController.text != '') {
                          gstNumberController.text =
                              gstNumberController.text.toUpperCase();
                          isValid = Utils.validateGSTNumber(gstNumberController.text);
                        }

                        if (isValid) {
                          validateAndSignUpUser();
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        backgroundColor: AppColors.primaryColor500,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 16)),
                    child: regularDarkText("SIGN UP",
                        fontSize: 15, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> validateAndSignUpUser() async {

    final data = {
      'primary_phone_number': primaryPhoneController.text.toString().trim(),
      'company_name': companyNameController.text.toString().trim(),
      'branch_name': branchNameController.text.toString().trim(),
      'gst_number': gstNumberController.text.toString().trim(),
      'shipping_address': shippingAddressController.text.toString().trim(),
      'contact_person_name': contactPersonController.text.toString().trim(),
      'email': contactEmailController.text.toString().trim(),
      'additional_phone_number':
          additionalPhoneController.text.toString().trim()
    };

    await registerController.registerUser(data);

    if (registerController.registerData.value.status == true) {
      Toast.success('You have been registered successfully.');
      setData(Constants.PRIMARY_PHONE_NUMBER, primaryPhoneController.text.toString().trim());
      Get.toNamed('/register_success');
    } else {
      Toast.error('Account Already Exist');
    }
  }
}
