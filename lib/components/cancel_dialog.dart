// import 'package:flutter/material.dart';
// import 'package:shreeveg/helper/route_helper.dart';
// import 'package:shreeveg/localization/language_constraints.dart';
// import 'package:shreeveg/utill/dimensions.dart';
// import 'package:shreeveg/utill/styles.dart';
// import 'package:shreeveg/view/base/custom_button.dart';
//
// class CancelDialog extends StatelessWidget {
//   final int? orderID;
//   const CancelDialog({Key? key, required this.orderID}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: Padding(
//         padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
//         child: Column(mainAxisSize: MainAxisSize.min, children: [
//           Container(
//             height: 70,
//             width: 70,
//             decoration: BoxDecoration(
//               color: Theme.of(context).primaryColor.withOpacity(0.2),
//               shape: BoxShape.circle,
//             ),
//             child: Icon(
//               Icons.check_circle,
//               color: Theme.of(context).primaryColor,
//               size: 50,
//             ),
//           ),
//           //SizedBox(height: Dimensions.paddingSizeLarge),
//
//           // fromCheckout ? Text(
//           //   getTranslated('order_placed_successfully', context),
//           //   style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeLarge, color: Theme.of(context).primaryColor),
//           // ) : SizedBox(),
//           // SizedBox(height: fromCheckout ? Dimensions.paddingSizeSmall : 0),
//
//           orderID != null
//               ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                   Text('${getTranslated('order_id', context)}:',
//                       style: poppinsMedium.copyWith(
//                           fontSize: Dimensions.fontSizeSmall)),
//                   const SizedBox(width: Dimensions.paddingSizeExtraSmall),
//                   Text(orderID.toString(),
//                       style: poppinsMedium.copyWith(
//                           fontSize: Dimensions.fontSizeSmall)),
//                 ])
//               : const SizedBox(),
//           const SizedBox(height: 30),
//
//           Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//             Icon(Icons.info, color: Theme.of(context).primaryColor),
//             Text(
//               getTranslated('payment_failed', context)!,
//               style:
//                   poppinsMedium.copyWith(color: Theme.of(context).primaryColor),
//             ),
//           ]),
//           const SizedBox(height: 10),
//
//           Text(
//             getTranslated('payment_process_is_interrupted', context)!,
//             style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 30),
//
//           Row(children: [
//             Expanded(
//                 child: SizedBox(
//               height: 50,
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.pushNamedAndRemoveUntil(
//                       context, RouteHelper.getMainRoute(), (route) => false);
//                 },
//                 style: TextButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       side: BorderSide(
//                           width: 2, color: Theme.of(context).primaryColor)),
//                 ),
//                 child: Text(getTranslated('maybe_later', context)!,
//                     style: poppinsMedium.copyWith(
//                         color: Theme.of(context).primaryColor)),
//               ),
//             )),
//             const SizedBox(width: 10),
//             Expanded(
//                 child: CustomButton(
//                     buttonText: 'Order Details',
//                     onPressed: () {
//                       Navigator.pop(context);
//                     })),
//           ]),
//         ]),
//       ),
//     );
//   }
// }
