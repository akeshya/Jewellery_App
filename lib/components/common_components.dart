import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:shopping_cart/model/category_list_modal.dart';
import 'package:shopping_cart/model/product_list_modal.dart';
import 'package:shopping_cart/model/search_product_modal.dart';
import 'package:shopping_cart/utils/app_colors.dart';
import '../pages/product_details_page.dart';
import '../utils/CustomBorder.dart';
import '../utils/CustomColors.dart';
import '../utils/CustomTextStyle.dart';

Widget regularDarkText(String nameText,
    {double? fontSize,
    Color? color,
    TextAlign? textAlign,
    double lineHeight = 1.0,
    double textScale = 1.0}) {
  return Text(nameText,
      textAlign: textAlign != null ? textAlign : TextAlign.center,
      overflow: TextOverflow.ellipsis,
      textScaleFactor: textScale,
      style: CustomTextStyle.textFormFieldRegular.copyWith(
          color: color != null ? color : CustomColors.COLOR_PRIMARY_500,
          fontSize: fontSize != null ? fontSize : 12,
          height: lineHeight,
          fontFamily: 'LatoBold',
          overflow: TextOverflow.ellipsis));
}

Widget regularLightText(String lightText, {Color? color, double? fontSize}) {
  return Text(lightText,
      textAlign: TextAlign.center,
      style: CustomTextStyle.textFormFieldRegular.copyWith(
          color: color != null ? color : CustomColors.COLOR_PRIMARY_500,
          fontSize: fontSize != null ? fontSize : 11,
          fontFamily: 'LatoReg'));
}

Widget commonBackButton(BuildContext? context) {
  return GestureDetector(
    onTap: () => context != null ? Navigator.of(context).pop() : null,
    child: Image.asset('images/back.png', width: 36, height: 46),
  );
}

Widget commonHorizontalLine() {
  return Container(height: 1, color: Colors.grey);
}

AppBar commonAppBar(
    String appbarTitle, BuildContext? context, List<Widget>? actions) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    leading: context == null
        ? null
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: commonBackButton(context),
          ),
    title: regularDarkText(appbarTitle, fontSize: 20),
    actions: actions == null ? null : actions,
  );
}

Widget commonSearchBar(
    BuildContext context,
    String searchingFor,
    String hintText,
    FutureOr<List<dynamic>> Function(String) fetchSuggestions,
    double borderRadius,
    Color borderColor,
    Color fillColor) {
  TextEditingController typeAheadController = TextEditingController();
  return TypeAheadField(
    builder: (context, controller, focusNode) {
      return TextField(
        controller: typeAheadController,
        focusNode: focusNode,
        autofocus: false,
        textInputAction: TextInputAction.search,
        textCapitalization: TextCapitalization.words,
        keyboardType: TextInputType.streetAddress,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.grey, fontSize: 20, fontFamily: 'LatoReg'),
          prefixIcon: Image.asset('images/ic_search.png',
              color: Colors.black, width: 20, height: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
                style: BorderStyle.solid,
                color: AppColors.primaryColor500,
                width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
                style: BorderStyle.solid,
                color: AppColors.primaryColor500,
                width: 1),
          ),
          filled: true,
          fillColor: Theme.of(context).cardColor,
        ),
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: AppColors.primaryColor500,
              fontSize: 20,
            ),
      );
    },
    // textFieldConfiguration: TextFieldConfiguration(
    //     style: DefaultTextStyle.of(context).style.copyWith(
    //         fontStyle: FontStyle.normal
    //     ),
    //     controller: typeAheadController,
    //     decoration: InputDecoration(
    //       fillColor: fillColor,
    //       hintText: hintText,
    //       hintStyle: TextStyle(color: Colors.grey, fontSize: 20, fontFamily: 'LatoReg'),
    //       prefixIcon: Image.asset('images/ic_search.png',
    //           color: Colors.black, width: 20, height: 20),
    //       enabledBorder: CustomBorder.enabledBorder.copyWith(
    //           borderSide: BorderSide(
    //               color: borderColor),
    //           borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
    //       contentPadding: EdgeInsets.only(
    //           top: 16, left: 12, right: 12, bottom: 8),
    //       border: CustomBorder.enabledBorder.copyWith(
    //         borderSide: BorderSide(color: Colors.transparent),
    //         borderRadius: BorderRadius.circular(20.0),
    //       ),
    //       enabled: true,
    //       filled: true,
    //     )
    // ),
    suggestionsCallback: (pattern) =>
        fetchSuggestions(typeAheadController.text),
    itemBuilder: (context, suggestion) {
      return ListTile(
        leading: Icon(Icons.shopping_cart),
        title: showTitleText(searchingFor, suggestion),
      );
    },
    onSelected: (suggestion) {
      print(suggestion);
      switch (searchingFor) {
        case 'universal':
          Navigator.of(context)
              .pushNamed('/product_details', arguments: suggestion);
          break;
        case 'categories':
          Navigator.of(context)
              .pushNamed('/product_listing', arguments: suggestion);
          break;
        case 'productListing':
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetailsPage(product: suggestion)));
          break;
        default:
          break;
      }
    },
  );
}

showTitleText(String searchingFor, Object? suggestion) {
  switch (searchingFor) {
    case 'universal':
      final searchItem = suggestion as SearchItem;
      return Text(searchItem.name);
    case 'categories':
      final searchItem = suggestion as Category;
      return Text(searchItem.cname);
    case 'productListing':
      final searchItem = suggestion as Product;
      return Text(searchItem.name);
    default:
      return SizedBox(height: 0);
  }
}
