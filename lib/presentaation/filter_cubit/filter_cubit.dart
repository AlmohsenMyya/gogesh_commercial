import 'package:bloc/bloc.dart';




class FilterOfferCubit<T> extends Cubit<T?> {
  FilterOfferCubit({required T? init}) : super(init);

  changeItem(T? item) {
    emit(item);
  }
}
class FilterAdsCubit<T> extends Cubit<T?> {
  FilterAdsCubit({required T? init}) : super(init);

  changeItem(T? item) {
    emit(item);
  }
}
