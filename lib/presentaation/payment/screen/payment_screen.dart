import 'package:commmercial_directory_seller/app/locator.dart';
import 'package:commmercial_directory_seller/app/router.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:commmercial_directory_seller/domain/entities/pyment_entity/payment_response.dart';
import 'package:commmercial_directory_seller/presentaation/activity_project/activity_bloc/activity_project_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/main/information_activity_bloc/information_activity_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({required this.response, super.key});
  final PaymentResponse response;

  @override
  Widget build(BuildContext context) {
    ProfileEntity? user = sl<LocalDataSource>().getValue(
      LocalDataKeys.profile,
    );
    return WebViewWidget(
      controller: WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..enableZoom(true)
        ..setNavigationDelegate(
          NavigationDelegate(
            // onProgress: (int progress) {
            // },
            onPageStarted: (String url) {},
            onPageFinished: (String url) async {
              if (url.split('/').sublist(4).join('/') == 'stripe') {
                if (response.type == 'Verification') {
                  AlertController.show(
                      "",
                      "Your account has been activated. You can add your first offer now"
                          .tr(),
                      TypeAlert.success);
                  user?.verification == true;
                  await sl<LocalDataSource>()
                      .setValue(LocalDataKeys.profile, user)
                      .then((value) => context.goNamed(Routes.home.name));
                  return;
                }
                if (response.type == 'Active_Cmmercial_Activity') {
                  context
                      .read<InformationActivityBloc>()
                      .add(const InformationActivityEvent.loadData());
                  await Future.delayed(const Duration(seconds: 2)).then(
                    (value) {
                      AlertController.show(
                          "",
                          "Your account has been activated. You can add your first offer now"
                              .tr(),
                          TypeAlert.success);
                      context.goNamed(Routes.home.name);
                      context.goNamed(Routes.addOffers.name);
                    },
                  );

                  return;
                }
                if (response.type == 'Subscription') {
                  context
                      .read<InformationActivityBloc>()
                      .add(const InformationActivityEvent.loadData());
                  context.goNamed(Routes.home.name);
                  return;
                }
              }
            },
            onWebResourceError: (WebResourceError error) {
              print(error.description);
            },
            onNavigationRequest: (NavigationRequest request) {
              if (request.url.startsWith('https://www.youtube.com/')) {
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          ),
        )
        ..loadRequest(Uri.parse(response.url!)),
    );
  }
}
