import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:commmercial_directory_seller/domain/request/chat/chat_request.dart';
import 'package:commmercial_directory_seller/domain/usecase/chat/make_chat_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_event.dart';
part 'report_state.dart';
part 'report_bloc.freezed.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final MakeChatUseCase makeChatUseCase;
  ReportBloc({required this.makeChatUseCase}) : super(ReportState.initial()) {
    on<ReportEvent>(_mapEventToState);
  }
  FutureOr<dynamic> _mapEventToState(
      ReportEvent event, Emitter<ReportState> emit) async {
    return event.map(
      makeChat: (value) async {
        emit(const ReportState.loading());

        var result = await makeChatUseCase(value.request);
        return emit(result.when(
            failure: (error) => ReportState.error(error!.localizedErrorMessage),
            success: (s) => ReportState.succes(s)));
      },
    );
  }
}
