import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:commmercial_directory_seller/domain/enums/enums.dart';

import 'package:commmercial_directory_seller/domain/usecase/categories/fetch_occasions_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/register_company/register_company_usecase.dart';
import 'package:commmercial_directory_seller/presentaation/activity_project/screens/details_project.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Utils.dart';
import '../../../data/register_company_data_source/register_remote_data_source.dart';
import '../../../domain/request/auth/register/register_part_two_seller.dart';
import '../../../domain/usecase/register_company/get_days_usecase.dart';
import '../screens/update_company_screen.dart';

part 'register_company_event.dart';
part 'register_company_state.dart';
part 'register_company_bloc.freezed.dart';

class RegisterCompanyBloc
    extends Bloc<RegisterCompanyEvent, RegisterCompanyState> {
  final RegisterCompanyUseCase registerCompanyUseCase;
  final GetdaysUseCase getdaysUseCase;
  final FetchOccasionsUseCase getSeasonsUseCase;
  RegisterCompanyBloc(
      {required this.registerCompanyUseCase,
      required this.getdaysUseCase,
      required this.getSeasonsUseCase})
      : super(const RegisterCompanyState.initial()) {
    on<RegisterCompanyEvent>(_mapEventToState);
  }

  FutureOr<dynamic> _mapEventToState(
      RegisterCompanyEvent event, Emitter<RegisterCompanyState> emit) async {
    return event.map(
      changeItem: (e) => emit(RegisterCompanyState.itemChanged(
        item: e.item,
      )),
      uploadImagecardIntity: (value) async {
        var result = await pickMultiImage();
        if (result.isNotEmpty) {
          return emit(
              RegisterCompanyState.loadedImagecardIntity(image: result));
        }
        return emit(const RegisterCompanyState.initial());
      },
      uploadImageLogo: (value) async {
        var result = await pickImage(value.source);
        if (result != null) {
          return emit(RegisterCompanyState.loadedImageLogo(image: result));
        }
        return emit(const RegisterCompanyState.initial());
      },
      uploadImageSignature: (value) async {
        var result = await pickImage(value.source);
        if (result != null) {
          return emit(
              RegisterCompanyState.loadedImageSignuature(image: result));
        }
        return emit(const RegisterCompanyState.initial());
      },
      uploadImageLisence: (value) async {
        var result = await pickImage(value.source);
        if (result != null) {
          return emit(RegisterCompanyState.loadedImageLisence(image: result));
        }
        return emit(const RegisterCompanyState.initial());
      },
      registerCompany: (request) async {
        emit(const RegisterCompanyState.loading());
        var result = await registerCompanyUseCase(request.request);
        return emit(result.when(
            failure: (error) => const RegisterCompanyState.eroor(),
            success: (s) => const RegisterCompanyState.succes()));
      },
    );
  }
}
