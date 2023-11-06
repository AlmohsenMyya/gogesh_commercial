import 'dart:async';
import 'package:commmercial_directory_seller/core/paginated/offers_paginated/offer_paginated.dart';
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/core/utils/model_id.dart';
import 'package:commmercial_directory_seller/domain/entities/offer_entity/offer_entity.dart';
import 'package:commmercial_directory_seller/domain/usecase/offer/get_offer_details._usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/offer/get_offer_updated_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../Utils.dart';
import '../../../../domain/entities/durations_entity/durations_response.dart';
import '../../../../domain/request/offers/offer_request.dart';
import '../../../../domain/usecase/offer/add_offers_usecase.dart';
import '../../../../domain/usecase/offer/get_durations_usecase.dart';
import '../../../domain/usecase/offer/delete_profile_usecase.dart';
import '../../../domain/usecase/offer/edit_offers_usecase.dart';

part 'add_edit_offer_event.dart';
part 'add_edit_offer_state.dart';
part 'add_edit_offer_bloc.freezed.dart';

class AddEditOfferBloc extends Bloc<AddEditOfferEvent, AddEditOfferState> {
  final GetDurationsUseCase? getDurationsUseCase;
  final AddOffersUseCase? addOffersUseCase;
  final DeleteOffersUseCase? deleteOffersUseCase;
  final EditOffersUseCase? editOffersUseCase;
  final GetOfferDetailsUseCase? getOfferDetailsUseCase;
  final GetOfferUpdatedDetailsUseCase? getOfferUpdatedDetailsUseCase;
  AddEditOfferBloc(
      {this.addOffersUseCase,
      this.deleteOffersUseCase,
      this.editOffersUseCase,
      this.getDurationsUseCase,
      this.getOfferDetailsUseCase,
      this.getOfferUpdatedDetailsUseCase})
      : super(const AddEditOfferState.initial()) {
    on<AddEditOfferEvent>((_mapEventToState));
  }
  FutureOr _mapEventToState(
      AddEditOfferEvent event, Emitter<AddEditOfferState> emit) {
    return event.map(
      loadOfferUpdateDetails: (value) async {
        emit(const AddEditOfferState.loading());
        var result =
            await getOfferUpdatedDetailsUseCase!(ModelID(id: value.updatedId));
        return emit(result.when(
            failure: (error) =>
                AddEditOfferState.error(error!.localizedErrorMessage),
            success: (s) => AddEditOfferState.dataLoaded(data: s!)));
      },
      removeAndUploadImage: (value) async {
        List<XFile> images = [];
        final result = await pickImage(value.source);
        if (result!.path.isNotEmpty) {
          images.addAll(value.images);
          images.removeWhere((element) => element.path == value.path);
          images.add(result);
          emit(AddEditOfferState.removeAndUploadedImage(
              images: images.toList()));
        } else {
          emit(const AddEditOfferState.initial());
        }
      },
      loadOfferDetails: (value) async {
        emit(const AddEditOfferState.loading());
        var result = await getOfferDetailsUseCase!(
            ModelID(id: value.id, path: value.path));
        return emit(result.when(
            failure: (error) =>
                AddEditOfferState.error(error!.localizedErrorMessage),
            success: (s) => AddEditOfferState.dataLoaded(data: s!)));
      },
      editOffers: (request) async {
        emit(const AddEditOfferState.editLoading());
        var result = await editOffersUseCase!(request.request);
        return emit(result.when(
            failure: (error) =>
                AddEditOfferState.error(error!.localizedErrorMessage),
            success: (s) => AddEditOfferState.succes(s)));
      },
      deleteOffers: (request) async {
        emit(const AddEditOfferState.loading());
        var result = await deleteOffersUseCase!(ModelID(id: request.id));
        return emit(result.when(
            failure: (error) =>
                AddEditOfferState.error(error!.localizedErrorMessage),
            success: (s) => AddEditOfferState.succes(s)));
      },
      addOffer: (request) async {
        emit(const AddEditOfferState.loading());
        var result = await addOffersUseCase!(request.request);
        return emit(result.when(
            failure: (error) =>
                AddEditOfferState.error(error!.localizedErrorMessage),
            success: (s) => AddEditOfferState.succes(s!)));
      },
      loadDurations: (value) async {
        emit(const AddEditOfferState.loading());
        var result = await getDurationsUseCase!(NoParams());

        return emit(result.when(
            failure: (error) => const AddEditOfferState.initial(),
            success: (s) {
              return AddEditOfferState.loadedDurations(data: s!.data);
            }));
      },
      uploadImage: (value) async {
        final result = await pickMultiImage();
        if (result.isNotEmpty) {
          emit(AddEditOfferState.imagePicked(image: result));
        } else {
          emit(const AddEditOfferState.initial());
        }
      },
      uploadVideo: (value) async {
        final result = await pickVideo(value.source);
        if (result!.isNotEmpty) {
          emit(
            AddEditOfferState.loadedVideo(
              image: result,
            ),
          );
        } else {
          emit(const AddEditOfferState.initial());
        }
      },
    );
  }
}
