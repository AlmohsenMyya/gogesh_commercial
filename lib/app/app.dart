import 'package:commmercial_directory_seller/app/Network_cubit/chec_out_network_cubit.dart';
import 'package:commmercial_directory_seller/app/locator.dart';
import 'package:commmercial_directory_seller/app/router.dart';
import 'package:commmercial_directory_seller/app/theme.dart';
import 'package:commmercial_directory_seller/domain/enums/enums.dart';
import 'package:commmercial_directory_seller/presentaation/activity_project/activity_bloc/activity_project_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/auth/Region_bloc/region_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/auth/bloc/auth_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/auth/city_bloc/city_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/auth/country_bloc/country_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/auth/location/location_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/auth/sections_bloc/sections_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/auth/services_bloc/service_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/chat/conversationSupport_bloc/conversation_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/chat/conversation_customer_bloc/conversation_customer_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/filter_cubit/filter_cubit.dart';
import 'package:commmercial_directory_seller/presentaation/home/home_offer_bloc/offer_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/main/bloc/bloc/main_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/main/information_activity_bloc/information_activity_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/my%20Advertising/ads_bloc/ads_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/payment/payment_bloc/payment_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/profile/bloc/profile_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/activity/activity_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/seasons/seasons_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/sector/sector_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/specialization/specialization_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/sub_sectors/sub_suctors_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:sizer/sizer.dart';

import '../presentaation/main/bloc/bottom_nav_cubit.dart';
import '../presentaation/main/bloc/messages_pill_cubit.dart';
import '../presentaation/main/bloc/notification_pill_cubit.dart';
import '../presentaation/main/bloc/side_menu_cubit.dart';
import '../presentaation/notifications/bloc/notification_bloc.dart';
import '../presentaation/register_company/bloc/register_company_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (contex) {
            return SideMenuCubit();
          }),
          BlocProvider(create: (context) => BottomNavCubit()),
          BlocProvider(
            create: (context) => ConversationBloc(
              getConversationSupportUseCase: sl(),
            ),
          ),
          BlocProvider(create: (context) => SectionsBloc(sl())),
          BlocProvider(
              create: (context) => ConversationCustomerBloc(
                  getConversationCustomerUseCase: sl())),
          BlocProvider(
              create: (context) => ChecOutNetworkCubit()..connectInternet()),
          BlocProvider(create: (context) => MainBloc()),
          BlocProvider(
            create: (context) => ActivityProjectBloc(
                getDetailsCompanyUseCase: sl(), editCompanyUseCase: sl())
              ..add(const ActivityProjectEvent.loadDetailsProfile()),
          ),
          BlocProvider(
            create: (context) => ProfileBloc(
              getProfileUseCase: sl(),
              changeEmailUseCase: sl(),
            )..add(const ProfileEvent.loadedProfile()),
            //)
          ),
          BlocProvider(
              create: (context) => SectorBloc(getSectorsUseCase: sl())),
          BlocProvider(
            create: (context) => CityBloc(getCityUseCase: sl()),
          ),
          BlocProvider(
              create: (context) => SeasonsBloc(
                    getSeasonsUseCase: sl(),
                  )
              // ..add(SeasonsEvent.loadSeasons(filter: Filter(page: 1))
              //          )
              ),
          BlocProvider(
              create: (context) => CountryBloc(getCountryUseCase: sl())),
          BlocProvider(create: (context) => RegionBloc(getRegionUseCase: sl())),
          BlocProvider(
              create: (context) =>
                  SpecializationBloc(getSpesialityUseCase: sl())),
          BlocProvider(
              create: (context) => SubSuctorsBloc(getSubSectorsUseCase: sl())),
          BlocProvider(
              create: (context) => ActivityBloc(getActivityUseCase: sl())),
          BlocProvider(create: (context) => LocationBloc(sl())
              //..add(const LocationEvent.pickLocation())
              ),
          BlocProvider(create: (_) => sl<NotificationPillCubit>()),
          BlocProvider(create: (context) => NotificationBloc(sl())),

          BlocProvider(create: (_) => sl<MessagesPillCubit>()),
          BlocProvider(
              create: (context) => ServiceBloc(getServicesUseCase: sl())),
          BlocProvider(
              create: (context) => SeasonsBloc(
                    getSeasonsUseCase: sl(),
                  )),
          //  ..add(const SeasonsEvent.loadSeasons())),
          BlocProvider(
            create: (context) => sl<RegisterCompanyBloc>(),
          ),
          BlocProvider(create: (contex) {
            return sl<AuthBloc>();
          }),
          BlocProvider(
            create: (context) =>
                InformationActivityBloc(getInformationSubscrptionUseCase: sl())
                  ..add(const InformationActivityEvent.loadData()),
          ),
          BlocProvider(
              create: (context) => PaymentBloc(addPaymentUseCase: sl())),
          BlocProvider(
            create: (context) => AdsBloc(sl()),
          ),
          BlocProvider(create: (context) => OfferBloc(sl())),
          BlocProvider(
            create: (context) => FilterOfferCubit<ServiceTypeEnum>(init: null),
          ),
          BlocProvider(
            create: (context) => FilterAdsCubit<ServiceTypeEnum>(init: null),
          ),
        ],
        child:
            //  DevicePreview(
            //     enabled: !kReleaseMode,
            //     builder: (context) => MaterialApp.router(
            //         localizationsDelegates: context.localizationDelegates,
            //         supportedLocales: context.supportedLocales,
            //         // locale: context.locale,
            //         useInheritedMediaQuery: true,
            //         locale: DevicePreview.locale(context),
            //         debugShowCheckedModeBanner: false,
            //         theme: AppTheme.lightTheme,
            //         routerConfig: router,
            //         builder: (context, child) {
            //           final device = DevicePreview.appBuilder(context, child);
            //           // final dialog = FlutterSmartDialog.init()(context, child);
            //           return Stack(
            //             children: [
            //               device,
            //               //dialog,
            //               const DropdownAlert(),
            //             ],
            //           );
            //         }
            MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          routerConfig: router,
          builder: (context, child) {
            final dialog = FlutterSmartDialog.init()(context, child);
            return Stack(
              children: [dialog, const DropdownAlert()],
            );
          },
        ),
        //)
        //)
      );
    });
  }
}
