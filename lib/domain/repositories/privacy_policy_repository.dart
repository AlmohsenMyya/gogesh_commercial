import 'package:commmercial_directory_seller/core/result/result.dart';

import '../../core/excptions/exceptions.dart';

abstract class PrivacyRepository {
  Future<Result<String, Exceptions>> fetchPrivacy();
}
