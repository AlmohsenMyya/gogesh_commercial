import 'package:commmercial_directory_seller/app/locator.dart' as locator;
import 'package:commmercial_directory_seller/core/notification/notification.dart';

import 'package:commmercial_directory_seller/firebase_options.dart';

import 'package:commmercial_directory_seller/app/pusher.dart' as pusher;
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_native/models/custom/currency_code.dart';
import 'package:flutter_paypal_native/models/custom/environment.dart';
import 'package:flutter_paypal_native/models/custom/order_callback.dart';
import 'package:flutter_paypal_native/models/custom/user_action.dart';
import 'dart:math';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_native/flutter_paypal_native.dart';
import 'package:flutter_paypal_native/models/custom/currency_code.dart';
import 'package:flutter_paypal_native/models/custom/environment.dart';
import 'package:flutter_paypal_native/str_helper.dart';
import 'package:flutter_paypal_native/models/custom/purchase_unit.dart';
import 'package:flutter_paypal_native/models/custom/user_action.dart';
import 'package:flutter_paypal_native/models/custom/order_callback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_native/str_helper.dart';

import 'app/app.dart';

import 'core/bootstrap/bootstrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await locator.init();
  await NotificationSetUp.init();

  await pusher.init();

  bootstrap(const MyApp());
}

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const CheckoutPage(),
//     );
//   }
// }

// class CheckoutPage extends StatefulWidget {
//   const CheckoutPage({super.key});

//   @override
//   State<CheckoutPage> createState() => _CheckoutPageState();
// }

// class _CheckoutPageState extends State<CheckoutPage> {
//   @override
//   Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text(
    //       "PayPal Checkout",
    //       style: TextStyle(fontSize: 20),
    //     ),
    //   ),
    //   body: Center(
    //     child: TextButton(
    //       onPressed: () async {
    //         Navigator.of(context).push(MaterialPageRoute(
    //           builder: (BuildContext context) => PaypalCheckout(
    //             sandboxMode: true,
    //             clientId:
    //                 "AcTd4IlybIEazPWcIHqJQXm7hZ1GhY1mCVP0zxLQMYuU9ocy7oiRg38M3wWxyoE3pU9OalkyrRJQq_YM",
    //             secretKey:
    //                 "EAUSjP4-k1CNuarGM1cgCB4g59ROzL9PBZU8wFObW_nVKeH4d4KIbx-Zb_aqM5t7cYPdCB3YoWsFoXM0",
    //              returnURL: "success.snippetcoder.com",
    //             cancelURL: "cancel.snippetcoder.com",
    //             transactions: const [
    //               {
    //                 "amount": {
    //                   "total": '10.12',
    //                   "currency": "USD",
    //                   "details": {
    //                     "subtotal": '10.12',
    //                     "shipping": '0',
    //                     "shipping_discount": 0
    //                   }
    //                 },
    //                 "description": "The payment transaction description.",
    //                 // "payment_options": {
    //                 //   "allowed_payment_method":
    //                 //       "INSTANT_FUNDING_SOURCE"
    //                 // },
    //                 "item_list": {
    //                   "items": [
    //                     {
    //                       "name": "A demo product",
    //                       "quantity": 1,
    //                       "price": '10.12',
    //                       "currency": "USD"
    //                     }
    //                   ],

    //                   // shipping address is not required though
    //                   "shipping_address": {
    //                     "recipient_name": "Jane Foster",
    //                     "line1": "Travis County",
    //                     "line2": "",
    //                     "city": "Austin",
    //                     "country_code": "US",
    //                     "postal_code": "73301",
    //                     "phone": "+00000000",
    //                     "state": "Texas"
    //                   },
    //                 }
    //               }
    //             ],
    //             note: "Contact us for any questions on your order.",
    //             onSuccess: (Map params) async {
    //               print("----------------------------------------------------");
    //               print("onSuccess: $params");
    //               print("----------------------------------------------------");
    //             },
    //             onError: (error) {
    //               print("onError: $error");
    //               Navigator.pop(context);
    //             },
    //             onCancel: () {
    //               print('cancelled:');
    //             },
    //           ),
    //         ));
    //       },
    //       style: TextButton.styleFrom(
    //         backgroundColor: Colors.teal,
    //         foregroundColor: Colors.white,
    //         shape: const BeveledRectangleBorder(
    //           borderRadius: BorderRadius.all(
    //             Radius.circular(1),
    //           ),
    //         ),
    //       ),
    //       child: const Text('Checkout'),
    //     ),
    //   ),
    // );
//   }
// }


