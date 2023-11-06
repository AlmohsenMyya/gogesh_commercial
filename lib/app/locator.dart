import 'dart:async';

import 'package:commmercial_directory_seller/data/ads_data_source/ads_remote_data_source.dart';
import 'package:commmercial_directory_seller/data/chat_data_source/chat_remote_data_source.dart';
import 'package:commmercial_directory_seller/data/local_data_source/db_provider.dart';
import 'package:commmercial_directory_seller/data/profile_data_source/profile_remote_data_source.dart';
import 'package:commmercial_directory_seller/data/remote_data_source.dart/remote_data_source.dart';
import 'package:commmercial_directory_seller/data/repositories/ads_repository.dart';
import 'package:commmercial_directory_seller/data/repositories/chat_repository.dart';
import 'package:commmercial_directory_seller/data/repositories/company_repository.dart';
import 'package:commmercial_directory_seller/data/repositories/notification_repository.dart';
import 'package:commmercial_directory_seller/data/repositories/offer_repository.dart';
import 'package:commmercial_directory_seller/data/repositories/payment_repository.dart';
import 'package:commmercial_directory_seller/data/repositories/privacy_repository.dart';
import 'package:commmercial_directory_seller/data/repositories/profile_repository.dart';
import 'package:commmercial_directory_seller/data/repositories/subsucribton_repository.dart';
import 'package:commmercial_directory_seller/domain/repositories/ads_repository.dart';
import 'package:commmercial_directory_seller/domain/repositories/chat_reository.dart';
import 'package:commmercial_directory_seller/domain/repositories/company_repository.dart';
import 'package:commmercial_directory_seller/domain/repositories/notification_repository.dart';
import 'package:commmercial_directory_seller/domain/repositories/offer_repository.dart';
import 'package:commmercial_directory_seller/domain/repositories/payment_repository.dart';
import 'package:commmercial_directory_seller/domain/repositories/privacy_policy_repository.dart';
import 'package:commmercial_directory_seller/domain/repositories/profile_repository.dart';
import 'package:commmercial_directory_seller/domain/repositories/subscription_repository.dart';
import 'package:commmercial_directory_seller/domain/usecase/ads/add_ads_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/ads/delete_ads_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/ads/edit_ads_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/ads/get_ads_details.dart';
import 'package:commmercial_directory_seller/domain/usecase/ads/get_ads_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/ads/get_places_ads_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/auth/check_password_use_case.dart';
import 'package:commmercial_directory_seller/domain/usecase/auth/completed_profile_use_case.dart';
import 'package:commmercial_directory_seller/domain/usecase/auth/forget_password_use_case.dart';
import 'package:commmercial_directory_seller/domain/usecase/auth/login_assistant_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/auth/reset_password_use_case.dart';
import 'package:commmercial_directory_seller/domain/usecase/categories/Fetch_sector_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/categories/fetch_subsectors_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/chat/get_chat_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/chat/get_conversation_customer_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/chat/get_conversation_support_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/chat/make_chat_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/chat/send_message_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/email/confirm_email_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/email/resend_email_confirmation_code_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/location/determine_location_use_case.dart';
import 'package:commmercial_directory_seller/domain/usecase/notification/notification_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/offer/get_offer_details._usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/offer/get_offer_updated_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/offer/get_offers_use_case.dart';
import 'package:commmercial_directory_seller/domain/usecase/payment/add_payment_use_case.dart';
import 'package:commmercial_directory_seller/domain/usecase/privacy_contactus/fetch_privacy_use_case.dart';
import 'package:commmercial_directory_seller/domain/usecase/profile/change_email_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/profile/change_password_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/profile/edit_profile_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/profile/get_details_profile_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/profile/get_profile_use_case.dart';
import 'package:commmercial_directory_seller/domain/usecase/register_company/add_assistant_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/register_company/delete_assistant_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/register_company/edit_company_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/register_company/edit_social_account_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/register_company/edit_work_days_use_case.dart';
import 'package:commmercial_directory_seller/domain/usecase/register_company/get_assistant_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/register_company/get_company_details_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/register_company/get_social_account.dart';
import 'package:commmercial_directory_seller/domain/usecase/register_company/get_work_days.dart';
import 'package:commmercial_directory_seller/domain/usecase/register_company/register_company_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/subscription/get_information_sub_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/subscription/get_package_sub_usecase.dart';
import 'package:commmercial_directory_seller/presentaation/auth/bloc/auth_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/bloc/register_company_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';

import '../data/auth_data_source/auth_data_source.dart';
import '../data/categories_data_source/categories_data_source.dart';
import '../data/custom_interceptor.dart';
import '../data/local_data_source/local_data_source.dart';
import '../data/offer_datat_source/offer_remote_data_source.dart';
import '../data/register_company_data_source/register_remote_data_source.dart';
import '../domain/usecase/auth/login_use_case.dart';
import '../domain/usecase/auth/sign_in_with_facebook_use_case.dart';
// import '../domain/usecase/auth/sign_in_with_facebook_use_case.dart';
import '../domain/usecase/auth/sign_in_with_google_use_case.dart';
import '../domain/usecase/categories/fetch_activities_usecase.dart';
import '../domain/usecase/categories/fetch_occasions_usecase.dart';
import '../domain/usecase/categories/fetch_section_use_case.dart';
import '../domain/usecase/categories/fetch_services_use_case.dart';
import '../domain/usecase/categories/fetch_specializations_usecase.dart';
import '../domain/usecase/chat/update_unread_messages_count_use_case.dart';
import '../domain/usecase/location/gat_region_use_case.dart';
import '../domain/usecase/location/get_city_use_case.dart';
import '../domain/usecase/location/get_country_use_case.dart';
import '../domain/usecase/offer/add_offers_usecase.dart';
import '../domain/usecase/offer/delete_profile_usecase.dart';
import '../domain/usecase/offer/edit_offers_usecase.dart';
import '../domain/usecase/offer/get_durations_usecase.dart';
import '../domain/usecase/profile/register_primary_use_case.dart';
import '../domain/usecase/register_company/get_days_usecase.dart';
import '../presentaation/main/bloc/messages_pill_cubit.dart';
import '../presentaation/main/bloc/notification_pill_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final box = await LocalDataSourceImpl.init();
  await DBProvider.db.initDB();
  await DBProvider.db.clear();
  sl
    // // external
    ..registerLazySingleton<Box<dynamic>>(
      () => box,
    )
    ..registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(sl()),
    )
    ..registerLazySingleton<DBProvider>(() => DBProvider.db)

    //....................data sources.............//

    ..registerLazySingleton<Dio>(
      () => Dio(BaseOptions(
          //   sendTimeout: Duration(minutes:3 ),
          //  receiveTimeout: const Duration(minutes:3 ),
          //    connectTimeout: Duration(minutes:20 ),
          contentType: 'application/json',
          headers: {'Accept': 'application/json'}))
        ..interceptors.add(CustomInterceptor()),
    )
    // categories
    ..registerLazySingleton<CategoriesRemoteDataSource>(
        () => CategoriesRemoteDataSource(sl()))
    //auth
    ..registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSource(sl()))
    ..registerSingleton<NotificationPillCubit>(
        NotificationPillCubit(sl())..updateNotificationCount(false))
    ..registerSingleton<MessagesPillCubit>(
        MessagesPillCubit(sl())..updateMessageCount(false))
    //register_company
    ..registerLazySingleton<RegisterRemoteDataSource>(
        () => RegisterRemoteDataSource(sl()))

    //offers
    ..registerLazySingleton<OfferRemoteDataSource>(
        () => OfferRemoteDataSource(sl()))

    //Profile
    ..registerLazySingleton<ProfileRemoteDataSource>(
        () => ProfileRemoteDataSource(sl()))

    //advertising
    ..registerLazySingleton<AdsRemoteDataSource>(
        () => AdsRemoteDataSource(sl()))

    //Chat

    ..registerLazySingleton<ChatRemoteDataSource>(
        () => ChatRemoteDataSource(sl()))

    //publicRemote//
    ..registerLazySingleton<RemoteDataSource>(() => RemoteDataSource(sl()))

//.......................repositories..........................//

    /// Offer
    ..registerLazySingleton<OfferRepository>(
        () => OfferRepositoryImpl(sl(), sl()))

    /// Ads
    ..registerLazySingleton<AdsRepository>(
      () => AdsRepositoryImpl(sl(), sl()),
    )
    //Company
    ..registerLazySingleton<CompanyRepository>(
      () => CompanyRepositoryImpl(sl(), sl()),
    )

    //privacyPolicy//
    ..registerLazySingleton<PrivacyRepository>(
      () => PrivacyRepositoryImpl(sl(), sl()),
    )
    //SuscriptionPackage//

    ..registerLazySingleton<SubscrptionRepository>(
      () => SubscriptionResponseImpl(
          localDataSource: sl(), remoteDataSource: sl()),
    )

//profile
    ..registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(
        dataSource: sl(),
        localDataSource: sl(),
      ),
    )
//....................notification..............//
    ..registerLazySingleton<NoticationRepository>(
      () => NotificationRepositoryImpl(sl(), sl()),
    )

    /// Location local
    // ..registerSingletonAsync<LocationRepository>(() async {
    //   final repo = LocationRepository(
    //       dbProvider: sl(), dataSource: sl(), localDataSource: sl());
    //   unawaited(repo.updateCitiesLocal());
    //   unawaited(repo.updateRegionsLocal());
    //   unawaited(repo.updateCountriesLocal());
    //   return repo;
    // })
    //
    // /// Categories local
    // ..registerSingletonAsync<CategoriesRepository>(() async {
    //   final repo = CategoriesRepository(dbProvider: sl(), dataSource: sl());
    //    unawaited(repo.updateActivities());
    //   unawaited(repo.updateSpecialization());
    //  unawaited(repo.updateServices());
    //   unawaited(repo.updateSection());
    //   unawaited(repo.updateOccasions());
    //   return repo;
    // })
    //.................payment.....................//

    ..registerLazySingleton<PaymentRepository>(
      () =>
          PaymentRepositoryImpl(localDataSource: sl(), remoteDataSource: sl()),
    )
    //...................chat......................//

    ..registerLazySingleton<ChatRepository>(
      () => ChatRepositoryImpl(
        dataSource: sl(),
        localDataSource: sl(),
      ),
    )

    //.......................use case..........................//

//..........................notification......................//
    ..registerLazySingleton(
      () => GetNotificationUseCase(
        notificationRepository: sl(),
      ),
    )
    //........................auth.......................//
    ..registerLazySingleton(
        () => SignInGoogleUseCase(dataSource: sl(), localDataSource: sl()))
    ..registerLazySingleton(() => ResendEmailConfirmationCodeUseCase(sl()))
    ..registerLazySingleton(() => ConfirmEmailUseCase(sl(), sl()))
    ..registerLazySingleton(
        () => CompleteProfileUseCase(dataSource: sl(), localDataSource: sl()))
    ..registerLazySingleton(() => UpdateUnreadMessagesCountUseCase(sl()))
    ..registerLazySingleton(
        () => SignInFacebookUseCase(dataSource: sl(), localDataSource: sl()))
    ..registerLazySingleton(
        () => CheckPasswordUseCase(dataSource: sl(), localDataSource: sl()))
    ..registerLazySingleton(
        () => ResetPasswordUseCase(dataSource: sl(), localDataSource: sl()))
    ..registerLazySingleton(
        () => ForgetPasswordUseCase(dataSource: sl(), localDataSource: sl()))
    ..registerLazySingleton(
        () => LoginUseCase(dataSource: sl(), localDataSource: sl()))
    ..registerLazySingleton(
        () => LoginAssistantUseCase(dataSource: sl(), localDataSource: sl()))
    ..registerLazySingleton(() =>
        RegisterPrimarySellerUseCase(dataSource: sl(), localDataSource: sl()))
    //.......................registerCompany......................//
    ..registerLazySingleton(
        () => GetDetailsCompanyUseCase(companyRepository: sl()))
    ..registerLazySingleton(() => EditWorkDaysUseCase(companyRepository: sl()))
    ..registerLazySingleton(() => AddAssistantUseCase(companyRepository: sl()))
    ..registerLazySingleton(
        () => DeleteAssistantUseCase(companyRepository: sl()))
    ..registerLazySingleton(() => GetWorkDaysUseCase(companyRepository: sl()))
    ..registerLazySingleton(() => GetAssistantUseCase(companyRepository: sl()))
    ..registerLazySingleton(
        () => GetSocialAccountUseCase(companyRepository: sl()))
    ..registerLazySingleton(
        () => EditSocialAccountUseCase(companyRepository: sl()))
    ..registerLazySingleton(() => EditCompanyUseCase(companyRepository: sl()))
    ..registerLazySingleton(
        () => RegisterCompanyUseCase(dataSource: sl(), localDataSource: sl()))
    ..registerLazySingleton(
        () => GetdaysUseCase(dataSource: sl(), localDataSource: sl()))

    //..................location....................//
    ..registerLazySingleton(() => GetCountryUseCase(
          sl(),
        ))
    ..registerLazySingleton(() => GetCityUseCase(
          sl(),
        ))
    ..registerLazySingleton(() => GetRegionUseCase(
          sl(),
        ))
    // categories
    ..registerLazySingleton(() => FetchSecorsUseCase(sl()))
    ..registerLazySingleton(() => FetchActivitiesUseCase(sl()))
    ..registerLazySingleton(() => FetchSpecializationsUseCase(sl()))
    ..registerLazySingleton(() => FetchOccasionsUseCase(sl()))
    ..registerLazySingleton(() => FetchServicesUseCase(sl()))
    ..registerLazySingleton(() => FetchSectionUseCase(sl()))
    ..registerLazySingleton(() => FetchSubSecorsUseCase(sl()))
    ..registerLazySingleton(() => DetermineLocationUseCase())
//...........................Profile.................//

    ..registerLazySingleton(() => GetProfileUseCase(profileRepository: sl()))
    ..registerLazySingleton(() => ChangeEmailUseCase(profileRepository: sl()))
    ..registerLazySingleton(
        () => ChangePasswordUseCase(profileRepository: sl()))
    ..registerLazySingleton(
        () => GetProfileDetailsUseCase(profileRepository: sl()))
    ..registerLazySingleton(() => EditProfileUseCase(profileRepository: sl()))

//....................offers......................//
    ..registerLazySingleton(
        () => GetDurationsUseCase(dataSource: sl(), localDataSource: sl()))
    ..registerLazySingleton(
        () => EditOffersUseCase(dataSource: sl(), localDataSource: sl()))
    ..registerLazySingleton(
        () => AddOffersUseCase(dataSource: sl(), localDataSource: sl()))
    ..registerLazySingleton(
        () => GetOfferUpdatedDetailsUseCase(offerRepository: sl()))
    ..registerLazySingleton(
        () => DeleteOffersUseCase(dataSource: sl(), localDataSource: sl()))
    ..registerLazySingleton(() => GetOfferUseCase(offerRepository: sl()))
    ..registerLazySingleton(() => GetOfferDetailsUseCase(offerRepository: sl()))

//...................advertising.....................//

    ..registerLazySingleton(
        () => EditAdsUseCase(dataSource: sl(), localDataSource: sl()))
    ..registerLazySingleton(() => AddAdsUseCase(adsRepository: sl()))
    ..registerLazySingleton(() => GetAdsDetailsUseCase(adsRepository: sl()))
    ..registerLazySingleton(
        () => DeleteAdsUseCase(dataSource: sl(), localDataSource: sl()))
    ..registerLazySingleton(() => GetAdsUseCase(adsRepository: sl()))
    ..registerLazySingleton(() => GetPlacesUseCase(adsRepository: sl()))

//....................SubscrptionPackage.........//

    ..registerLazySingleton(
      () => GetPackageSubscrptionUseCase(
        subscrptionRepository: sl(),
      ),
    )
    ..registerLazySingleton(
      () => GetInformationSubscrptionUseCase(
        subscrptionRepository: sl(),
      ),
    )
//....................privacyPolicy...........//

    ..registerLazySingleton(
      () => GetPrivacyUseCase(
        privacyRepository: sl(),
      ),
    )
    //................payment....................//
    ..registerLazySingleton(
      () => AddPaymentUseCase(
        paymentRepository: sl(),
      ),
    )

//.................Chat.......................//
    ..registerLazySingleton(() => SendMessageUseCase(chatRepository: sl()))
    ..registerLazySingleton(() => MakeChatUseCase(chatRepository: sl()))
    ..registerLazySingleton(
        () => GetConversationSupportUseCase(chatRepository: sl()))
    ..registerLazySingleton(
        () => GetConversationCustomerUseCase(chatRepository: sl()))
    ..registerLazySingleton(() => GetChatUseCase(chatRepository: sl()))

    //blocs call instance name

    //auth
    ..registerLazySingleton(() => AuthBloc(
        signInGoogleUseCase: sl(),
        signInFacebookUseCase: sl(),
        registerCompanyUseCase: sl(),
        registerPrimarySellerUseCase: sl(),
        loginUseCase: sl(),
        checkPasswordUseCase: sl(),
        forgetPasswordUseCase: sl(),
        resetPasswordUseCase: sl(),
        completeProfileUseCase: sl(),
        confirmEmailUseCase: sl(),
        loginAssistantUseCase: sl(),
        resendEmailConfirmationCodeUseCase: sl()))

    //registerCompany
    ..registerLazySingleton(() => RegisterCompanyBloc(
        registerCompanyUseCase: sl(),
        getdaysUseCase: sl(),
        getSeasonsUseCase: sl()));
}
