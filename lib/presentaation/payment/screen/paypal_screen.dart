import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:go_router/go_router.dart';

// class PaypalScreen extends StatelessWidget {
//   const PaypalScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "PayPal Checkout",
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//       body: Center(
//         child: TextButton(
//           onPressed: () async {
//             Navigator.of(context).push(MaterialPageRoute(
//               builder: (BuildContext context) => PaypalCheckout(
//                 sandboxMode: true,
//                 clientId:
//                     "AcTd4IlybIEazPWcIHqJQXm7hZ1GhY1mCVP0zxLQMYuU9ocy7oiRg38M3wWxyoE3pU9OalkyrRJQq_YM",
//                 secretKey:
//                     "EAUSjP4-k1CNuarGM1cgCB4g59ROzL9PBZU8wFObW_nVKeH4d4KIbx-Zb_aqM5t7cYPdCB3YoWsFoXM0",
//                 returnURL: "success.snippetcoder.com",
//                 cancelURL: "cancel.snippetcoder.com",
//                 transactions: const [
//                   {
//                     "amount": {
//                       "total": '10.12',
//                       "currency": "USD",
//                       "details": {
//                         "subtotal": '10.12',
//                         "shipping": '0',
//                         "shipping_discount": 0
//                       }
//                     },
//                     "description": "The payment transaction description.",
//                     // "payment_options": {
//                     //   "allowed_payment_method":
//                     //       "INSTANT_FUNDING_SOURCE"
//                     // },
//                     "item_list": {
//                       "items": [
//                         {
//                           "name": "A demo product",
//                           "quantity": 1,
//                           "price": '10.12',
//                           "currency": "USD"
//                         }
//                       ],

//                       // shipping address is not required though
//                       "shipping_address": {
//                         "recipient_name": "Jane Foster",
//                         "line1": "Travis County",
//                         "line2": "",
//                         "city": "Austin",
//                         "country_code": "US",
//                         "postal_code": "73301",
//                         "phone": "+00000000",
//                         "state": "Texas"
//                       },
//                     }
//                   }
//                 ],
//                 note: "Contact us for any questions on your order.",
//                 onSuccess: (Map params) async {
//                   print("----------------------------------------------------");
//                   print("onSuccess: $params");
//                   print("----------------------------------------------------");
//                 },
//                 onError: (error) {
//                   print("onError: $error");
//                   Navigator.pop(context);
//                 },
//                 onCancel: () {
//                   print('cancelled:');
//                 },
//               ),
//             ));
//           },
//           style: TextButton.styleFrom(
//             backgroundColor: Colors.teal,
//             foregroundColor: Colors.white,
//             shape: const BeveledRectangleBorder(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(1),
//               ),
//             ),
//           ),
//           child: const Text('Checkout'),
//         ),
//       ),
//     );
//   }
// }

class PaypalScreen extends StatelessWidget {
  const PaypalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PaypalCheckout(
      sandboxMode: true,
      clientId:
          "AcTd4IlybIEazPWcIHqJQXm7hZ1GhY1mCVP0zxLQMYuU9ocy7oiRg38M3wWxyoE3pU9OalkyrRJQq_YM",
      secretKey:
          "EAUSjP4-k1CNuarGM1cgCB4g59ROzL9PBZU8wFObW_nVKeH4d4KIbx-Zb_aqM5t7cYPdCB3YoWsFoXM0",
      returnURL: "success.snippetcoder.com",
      cancelURL: "cancel.snippetcoder.com",
      transactions: const [
        {
          "amount": {
            "total": '10.12',
            "currency": "USD",
            "details": {
              "subtotal": '10.12',
              "shipping": '0',
              "shipping_discount": 0
            }
          },
          "description": "The payment transaction description.",
          // "payment_options": {
          //   "allowed_payment_method":
          //       "INSTANT_FUNDING_SOURCE"
          // },
          "item_list": {
            "items": [
              {
                "name": "A demo product",
                "quantity": 1,
                "price": '10.12',
                "currency": "USD"
              }
            ],

            // shipping address is not required though
            "shipping_address": {
              "recipient_name": "Jane Foster",
              "line1": "Travis County",
              "line2": "",
              "city": "Austin",
              "country_code": "US",
              "postal_code": "73301",
              "phone": "+00000000",
              "state": "Texas"
            },
          }
        }
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        print("----------------------------------------------------");
        print("onSuccess: $params");
        print("----------------------------------------------------");
      },
      onError: (error) {
        print("onError000: $error");
        //context.pop();
      },
      onCancel: () {
        print('cancelled:');
      },
    );
  }
}
