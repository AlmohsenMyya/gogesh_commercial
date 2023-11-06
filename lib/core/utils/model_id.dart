import 'package:freezed_annotation/freezed_annotation.dart';

import '../use_case/use_case.dart';

class ModelID extends Params {
  const ModelID({required this.id,this.path});
  final int id;
  final String? path; 
  @override
  List<Object?> get props => [id,path];
}
