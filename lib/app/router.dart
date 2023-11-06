import 'package:commmercial_directory_seller/domain/entities/chat_entity/conversation_response.dart';
import 'package:commmercial_directory_seller/domain/entities/offer_entity/offer_entity.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:commmercial_directory_seller/domain/entities/pyment_entity/payment_response.dart';
import 'package:commmercial_directory_seller/domain/request/auth/register/register_primary_seller.dart';
import 'package:commmercial_directory_seller/domain/request/profile/edit_profile_request.dart';
import 'package:commmercial_directory_seller/presentaation/activity_project/screens/add_assistant.dart';
import 'package:commmercial_directory_seller/presentaation/activity_project/screens/details_project.dart';
import 'package:commmercial_directory_seller/presentaation/activity_project/screens/edit_social_account.dart';
import 'package:commmercial_directory_seller/presentaation/activity_project/screens/edit_work_days.dart';
import 'package:commmercial_directory_seller/presentaation/activity_project/screens/profile_project.dart';
import 'package:commmercial_directory_seller/presentaation/auth/screens/email_confirm_screen.dart';
import 'package:commmercial_directory_seller/presentaation/auth/screens/register_seller_screen.dart';
import 'package:commmercial_directory_seller/presentaation/chat/screen/chat%20screen.dart';
import 'package:commmercial_directory_seller/presentaation/chat/screen/conversatios_screen.dart';
import 'package:commmercial_directory_seller/presentaation/my%20Advertising/screen/ads_details_screen.dart';
import 'package:commmercial_directory_seller/presentaation/my%20Advertising/screen/edit_advertising.dart';
import 'package:commmercial_directory_seller/presentaation/payment/screen/payment_screen.dart';
import 'package:commmercial_directory_seller/presentaation/payment/screen/paypal_screen.dart';
import 'package:commmercial_directory_seller/presentaation/profile/screens/change_email.dart';
import 'package:commmercial_directory_seller/presentaation/profile/screens/complete_edit_profile.dart';
import 'package:commmercial_directory_seller/presentaation/profile/screens/email_confirm_profile.dart';
import 'package:commmercial_directory_seller/presentaation/profile/screens/security_screen.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/screens/social_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/local_data_source/local_data_keys.dart';
import '../data/local_data_source/local_data_source.dart';
import '../domain/request/auth/register/register_part_two_seller.dart';
import '../presentaation/Subscriptions/screen/Subscriptions_screen.dart';
import '../presentaation/Subscriptions/screen/add_Subscriptions.dart';
import '../presentaation/auth/screens/auth_screen.dart';
import '../presentaation/auth/screens/fill_profile_screen.dart';
import '../presentaation/auth/screens/forget_password_screen.dart';
import '../presentaation/auth/screens/login_screen.dart';
import '../presentaation/auth/screens/new_password_screen.dart';
import '../presentaation/auth/screens/reset_password_code_screen.dart';
import '../presentaation/auth/screens/signup_screen.dart';
import '../presentaation/subscription_status/screens/subscrption_status.dart';
import '../presentaation/home/screens/home_screen.dart';
import '../presentaation/main/main_screen.dart';
import '../presentaation/my Advertising/screen/add_advertising.dart';
import '../presentaation/my Advertising/screen/my Advertising.dart';
import '../presentaation/notifications/screens/notifications_screen.dart';
import '../presentaation/offer/screens/add_offers.dart';
import '../presentaation/offer/screens/edit offers.dart';
import '../presentaation/offer/screens/offers_details_screen.dart';
import '../presentaation/on_boarding/screens/on_boarding_screen.dart';
import '../presentaation/privacy_policy/screen/privacy_policy_screen.dart';
import '../presentaation/profile/screens/change_password_screen.dart';
import '../presentaation/profile/screens/edit_profile_screen.dart';
import '../presentaation/profile/screens/profile_screen.dart';
import '../presentaation/register_company/screens/select_days_screen.dart';
import '../presentaation/register_company/screens/update_company_screen.dart';
import '../presentaation/report/screens/report_screen.dart';
import 'locator.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

String _initialLocation() {
  var userType = sl<LocalDataSource>().getValue(
    LocalDataKeys.userType,
  );
  ProfileEntity? user = sl<LocalDataSource>().getValue(
    LocalDataKeys.profile,
  );
  // if (user != null) {
  //   bool completed = user.completed ?? false;
  //   bool commercial = user.commerialActivity ?? false;
  //   if (!completed) {
  //     return Routes.completeProfile.path;
  //   }
  //   if (!commercial) {
  //     return Routes.upgradeAccount.path;
  //   }
  // }
  if (userType == UserType.authenticated) {
    return Routes.home.path;
  } else if (userType == UserType.onboarding) {
    return Routes.auth.path;
  } else {
    return Routes.onBoarding.path;
  }
}

GoRouter router = GoRouter(
  initialLocation: _initialLocation(),
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  routes: _routes,
  // redirect: (context, state) {
  // ProfileEntity? user = sl<LocalDataSource>().getValue(
  //   LocalDataKeys.profile,
  // );

  //   if (user != null) {
  //     final completed = user.completed ?? false;
  //     // final commerialActivity = user.commerialActivity ?? false;
  //     //  print(user.toJson());

  //     if (!completed) {
  //       return router.namedLocation(
  //         Routes.home.name,
  //       );
  //     }
  //   }
  //   return null;
  // },
);

List<RouteBase> get _routes => <RouteBase>[
      GoRoute(
        path: Routes.emailConfirmation.path,
        name: Routes.emailConfirmation.name,
        builder: (context, state) => EmailConfirmationScreen(
          email: state.queryParameters["email"] ?? "",
          password: state.queryParameters["password"] ?? "",
        ),
        parentNavigatorKey: _rootNavigatorKey,
        redirect: (context, state) {},
      ),
      GoRoute(
          path: Routes.emailConfirmationProfile.path,
          name: Routes.emailConfirmationProfile.name,
          builder: (context, state) => EmailConfirmationProfileScreen(
                email: state.queryParameters["email"] ?? "",
              ),
          parentNavigatorKey: _rootNavigatorKey),
      GoRoute(
        path: Routes.upgradeAccount.path,
        name: Routes.upgradeAccount.name,
        builder: (context, state) => MerchantAccountDevelopment(),
        parentNavigatorKey: _rootNavigatorKey,
      ),
      GoRoute(
        path: Routes.paypalscreen.path,
        name: Routes.paypalscreen.name,
        builder: (context, state) => const PaypalScreen(),
        parentNavigatorKey: _rootNavigatorKey,
      ),
      GoRoute(
        path: Routes.paymentScreen.path,
        name: Routes.paymentScreen.name,
        builder: (context, state) =>
            PaymentScreen(response: state.extra as PaymentResponse),
        parentNavigatorKey: _rootNavigatorKey,
      ),
      GoRoute(
        path: Routes.socialAccounts.path,
        name: Routes.socialAccounts.name,
        builder: (context, state) => SocialAccountsScreen(
            information: state.extra as RegisterPartTwoSeller),
        parentNavigatorKey: _rootNavigatorKey,
      ),
      GoRoute(
          path: Routes.selectDays.path,
          name: Routes.selectDays.name,
          builder: (context, state) => SelectDaysScreen(
                information: state.extra as RegisterPartTwoSeller,
              ),
          parentNavigatorKey: _rootNavigatorKey),
      GoRoute(
          path: Routes.changePassword.path,
          name: Routes.changePassword.name,
          builder: (context, state) => const ChangePasswordScreen(),
          parentNavigatorKey: _rootNavigatorKey),
      GoRoute(
          path: Routes.editEmail.path,
          name: Routes.editEmail.name,
          builder: (context, state) => ChangeEmailScreen(),
          parentNavigatorKey: _rootNavigatorKey),
      GoRoute(
        path: Routes.securityscreen.path,
        name: Routes.securityscreen.name,
        builder: (context, state) => SecurityScreen(),
        parentNavigatorKey: _rootNavigatorKey,
      ),
      GoRoute(
          path: Routes.fillProfile.path,
          name: Routes.fillProfile.name,
          builder: (context, state) => FillProfileScreen(
              email: state.queryParameters["email"] ?? "",
              password: state.queryParameters["password"] ?? "",
              passwordConfirmation:
                  state.queryParameters["passwordConfirmation"] ?? ""),
          parentNavigatorKey: _rootNavigatorKey),

      GoRoute(
          path: Routes.onBoarding.path,
          name: Routes.onBoarding.name,
          builder: (context, state) => const OnBoardingScreen(),
          parentNavigatorKey: _rootNavigatorKey),
      GoRoute(
          path: Routes.registerSellerScreen.path,
          name: Routes.registerSellerScreen.name,
          builder: (context, state) => RegisterSellerScreen(
                informationPrimay: state.extra as RegisterPrimarySeller,
              ),
          parentNavigatorKey: _rootNavigatorKey),

      GoRoute(
          path: Routes.notification.path,
          name: Routes.notification.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => const NotificationsScreen()),
      GoRoute(
        path: Routes.profileProject.path,
        name: Routes.profileProject.name,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const ProfileProjectScreen(),
      ),
      GoRoute(
          path: Routes.addassistant.path,
          name: Routes.addassistant.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => AddAssistantScreen()),

      GoRoute(
          path: Routes.editsocialaccount.path,
          name: Routes.editsocialaccount.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => EditSocialAccount()),

      GoRoute(
          path: Routes.editworkdays.path,
          name: Routes.editworkdays.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => EditWorkDays()),

      GoRoute(
          path: Routes.detailsProject.path,
          name: Routes.detailsProject.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => DetailsProjectScreen()),
      GoRoute(
          path: Routes.completeeditProfile.path,
          name: Routes.completeeditProfile.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => CompletEditProfile(
                informationPrimay: state.extra as EditProfileRequest,
              )),

      //
      GoRoute(
        path: Routes.subscriptions.path,
        name: Routes.subscriptions.name,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const Subscriptions(),
      ),
      GoRoute(
          path: Routes.addSubscription.path,
          name: Routes.addSubscription.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => AddSubscription()),
      GoRoute(
          path: Routes.editoffers.path,
          name: Routes.editoffers.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => Editoffers(
                offer: state.extra as OfferEntity,
              )),
      //

      GoRoute(
          path: Routes.report.path,
          name: Routes.report.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => ReportScreen()),
      GoRoute(
          path: Routes.stateSubscrption.path,
          name: Routes.stateSubscrption.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => const StateSubscriptionScreen()),
      GoRoute(
          path: Routes.privacyPolicy.path,
          name: Routes.privacyPolicy.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => const PrivacyPolicy()),
      GoRoute(
          path: Routes.addOffers.path,
          name: Routes.addOffers.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => AddOffers()),

      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            String name = "";
            if (state.queryParameters["name"] != null) {
              name = state.queryParameters["name"]!;
            } else {
              name = "filtering";
            }
            return MainScreen(
              name: name,
              child: child,
            );
          },
          routes: [
            GoRoute(
                path: Routes.home.path,
                name: Routes.home.name,
                builder: (context, state) => const HomeScreen(),
                parentNavigatorKey: _shellNavigatorKey,
                redirect: (context, state) {
                  ProfileEntity? user = sl<LocalDataSource>().getValue(
                    LocalDataKeys.profile,
                  );

                  if (user != null) {
                    // print(user.toJson());

                    final completed = user.completed ?? false;
                    if (!completed) {
                      return router.namedLocation(
                        Routes.fillProfile.name,
                      );
                    }
                  }
                  return null;
                },
                routes: [
                  GoRoute(
                    path: Routes.offerDetails.path,
                    name: Routes.offerDetails.name,
                    builder: (_, state) => OfferDetailsScreen(
                      id: state.extra as int?,
                    ),
                    parentNavigatorKey: _rootNavigatorKey,
                  ),
                ]),
            GoRoute(
                path: Routes.me.path,
                name: Routes.me.name,
                builder: (context, state) => ProfileScreen(
                      state: state.extra as bool,
                    ),
                parentNavigatorKey: _shellNavigatorKey,
                routes: [
                  GoRoute(
                      path: Routes.editProfile.path,
                      name: Routes.editProfile.name,
                      builder: (context, state) => EditProfileScreen(),
                      parentNavigatorKey: _rootNavigatorKey),
                ]),
            GoRoute(
                path: Routes.myAdvertising.path,
                name: Routes.myAdvertising.name,
                builder: (context, state) => const myAdvertising(),
                parentNavigatorKey: _shellNavigatorKey,
                routes: [
                  GoRoute(
                    path: Routes.adDetails.path,
                    name: Routes.adDetails.name,
                    builder: (_, state) => AdsDetailsScreen(
                      id: state.extra as int?,
                    ),
                    parentNavigatorKey: _rootNavigatorKey,
                  ),
                  GoRoute(
                      path: Routes.editAdvertising.path,
                      name: Routes.editAdvertising.name,
                      builder: (context, state) => EditAdvertising(
                            id: state.extra as int,
                          ),
                      parentNavigatorKey: _rootNavigatorKey),
                  GoRoute(
                      path: Routes.addAdvertising.path,
                      name: Routes.addAdvertising.name,
                      builder: (context, state) => AddAdvertising(),
                      parentNavigatorKey: _rootNavigatorKey)
                ]),
            GoRoute(
                path: Routes.listchatscreen.path,
                name: Routes.listchatscreen.name,
                parentNavigatorKey: _shellNavigatorKey,
                builder: (context, state) => const ConversationsScreen(),
                routes: [
                  GoRoute(
                      path: Routes.chat.path,
                      name: Routes.chat.name,
                      builder: (context, state) => ChatScreen(
                            conversation: state.extra as ConversationEntity,
                            type: state.queryParameters["type"] == ""
                                ? null
                                : state.queryParameters["type"],
                          ),
                      parentNavigatorKey: _rootNavigatorKey),
                ]),
          ]),
      GoRoute(
          path: Routes.auth.path,
          name: Routes.auth.name,
          builder: (_, __) => const AuthScreen(),
          routes: [
            GoRoute(
                path: Routes.signUp.path,
                name: Routes.signUp.name,
                builder: (context, state) => SignUpScreen(),
                parentNavigatorKey: _rootNavigatorKey,
                routes: [
                  // GoRoute(
                  //     path: Routes.fillProfile.path,
                  //     name: Routes.fillProfile.name,
                  //     builder: (context, state) => FillProfileScreen(
                  //         email: state.queryParameters["email"] ?? "",
                  //         password: state.queryParameters["password"] ?? "",
                  //         passwordConfirmation:
                  //             state.queryParameters["passwordConfirmation"] ??
                  //                 ""),
                  //     parentNavigatorKey: _rootNavigatorKey),
                ]),
            GoRoute(
                path: Routes.logIn.path,
                name: Routes.logIn.name,
                builder: (context, state) => LogInScreen(),
                parentNavigatorKey: _rootNavigatorKey,
                routes: [
                  GoRoute(
                      path: Routes.resetPassword.path,
                      name: Routes.resetPassword.name,
                      builder: (context, state) => ForgetPasswordScreen(),
                      routes: [
                        GoRoute(
                            path: Routes.resetPasswordCode.path,
                            name: Routes.resetPasswordCode.name,
                            builder: (context, state) =>
                                ResetPasswordCodeScreen(
                                  email: state.queryParameters["email"] ?? "",
                                ),
                            routes: [
                              GoRoute(
                                path: Routes.newPassword.path,
                                name: Routes.newPassword.name,
                                builder: (context, state) => NewPasswordScreen(
                                  code: state.queryParameters["code"] ?? "",
                                ),
                              )
                            ]),
                      ]),
                ]),
          ]),
    ];

enum Routes {
  auth('auth', '/login'),
  onBoarding('on_boarding', '/on_boarding'),
  signUp('signup_page', 'signup'),
  completeeditProfile('completeeditProfile', '/completeeditProfile'),

  logIn('login_page', 'login'),
  notification('notification', '/notification'),
  report('report', '/report'),
  home('home', '/home'),
  editoffers('editoffers', '/editoffers'),
  offerDetails('offer_details', 'offer_details'),
  stateSubscrption('stateSubscrption', '/stateSubscrption'),
  privacyPolicy('privacy_policy', '/privacy_policy'),
  adDetails('ad_details', 'ad_details'),
  addOffers("add_offers", "/add_offers"),
  myAdvertising('myadvertising', '/myadvertising'),
  addAdvertising('add_advertising', 'add_advertising'),
  editAdvertising('edit_advertising', 'edit_advertising'),

  addSubscription('addSubscription', '/addSubscription'),
  subscriptions('Subscription', '/Subscription'),
  ads('ads', '/ads'),
  me('me', '/me'),
  chat('chat', 'chat'),
  fillProfile('fill_profile', '/fill_profile'),
  upgradeAccount('upgradeAccount', '/upgradeAccount'),
  resetPassword('reset_password', 'reset_password'),
  resetPasswordCode('reset_password_code', 'reset_password_code'),
  newPassword('new_password', 'new_password'),
  socialAccounts('accountants', '/accountants'),
  editProfile('editProfile', 'editProfile'),
  listchatscreen('list_chat', '/list_chat'),
  selectDays('SelectDays', '/SelectDays'),
  editsocialaccount('editsocialaccount', '/editsocialaccount'),
  editworkdays('editworkdays', '/editworkdays'),
  addassistant('AddAssistant', '/addassistant'),
  completeProfile('complete_profile', '/complete_profile'),
  paymentScreen('paymentScreen', '/paymentScreen'),
  paypalscreen('paypalscreen', '/paypalscreen'),
  securityscreen('SecurityScreen', '/SecurityScreen'),
  changePassword('change_password', '/change_password'),
  editEmail('editEmail', '/editEmail'),
  emailConfirmation('email_confirmation', '/email_confirmation'),
  emailConfirmationProfile(
      'email_confirmationProfile', '/email_confirmationProfile'),
  detailsProject('detailsProject', '/detailsProject'),
  profileProject('profileProject', '/profileProject'),
  registerSellerScreen('registerSellerScreen', '/registerSellerScreen'),
  ;

  const Routes(this.name, this.path);

  final String name;
  final String path;
}
