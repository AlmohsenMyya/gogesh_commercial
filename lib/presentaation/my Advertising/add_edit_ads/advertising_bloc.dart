import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:commmercial_directory_seller/Utils.dart';
import 'package:commmercial_directory_seller/core/utils/model_id.dart';
import 'package:commmercial_directory_seller/domain/entities/ads_entity/ads_entity.dart';
import 'package:commmercial_directory_seller/domain/entities/durations_entity/durations_response.dart';
import 'package:commmercial_directory_seller/domain/request/ads/ads_request.dart';
import 'package:commmercial_directory_seller/domain/usecase/ads/add_ads_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/ads/get_ads_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../domain/usecase/ads/delete_ads_usecase.dart';
import '../../../domain/usecase/ads/edit_ads_usecase.dart';

part 'advertising_event.dart';
part 'advertising_state.dart';
part 'advertising_bloc.freezed.dart';

class AddEditAdsBloc extends Bloc<AddEditAdsEvent, AddEditAdsState> {
  final AddAdsUseCase? addAdsUseCase;
  final DeleteAdsUseCase? deleteAdsUseCase;
  final EditAdsUseCase? editAdsUseCase;
  final GetAdsDetailsUseCase? getAdsDetailsUseCase;
  AddEditAdsBloc({
    this.addAdsUseCase,
    this.deleteAdsUseCase,
    this.editAdsUseCase,
    
    this.getAdsDetailsUseCase,
  }) : super(const AddEditAdsState.initial()) {
    on<AddEditAdsEvent>((_mapEventToState));
  }
  FutureOr _mapEventToState(
      AddEditAdsEvent event, Emitter<AddEditAdsState> emit) {
    return event.map(
      editAds: (request) async {
        emit(const AddEditAdsState.loadingEdit());
        var result = await editAdsUseCase!(request.request);
        return emit(result.when(
            failure: (error) =>
                AddEditAdsState.error(error!.localizedErrorMessage),
            success: (s) => AddEditAdsState.succes(s)));
      },
      loadAdsDetails: (value) async {
        emit(const AddEditAdsState.loading());
        var result =
            await getAdsDetailsUseCase!(ModelID(id: value.id, path: value.path));
        return emit(result.when(
            failure: (error) =>
                AddEditAdsState.error(error!.localizedErrorMessage),
            success: (s) => AddEditAdsState.dataLoaded(ads: s!.data)));
      },
      deleteAds: (request) async {
        emit(const AddEditAdsState.loading());
        var result = await deleteAdsUseCase!(ModelID(id: request.id));
        return emit(result.when(
            failure: (error) =>
                AddEditAdsState.error(error!.localizedErrorMessage),
            success: (s) => AddEditAdsState.succes(s)));
      },
      addAds: (request) async {
        emit(const AddEditAdsState.loading());
        var result = await addAdsUseCase!(request.request);
        return emit(result.when(
            failure: (error) =>
                AddEditAdsState.error(error!.localizedErrorMessage),
            success: (s) => AddEditAdsState.succes(s)));
      },
      uploadImage: (value) async {
        final result = await pickImage(value.source);
        if (result!.path.isNotEmpty) {
          emit(AddEditAdsState.imagePicked(image: result));
        } else {
          emit(const AddEditAdsState.initial());
        }
      },
    );
  }
}
