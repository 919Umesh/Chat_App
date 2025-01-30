import 'package:dio/dio.dart';
import '../../base/Api_end_point/api_endpoints.dart';
import '../../base/Dio_services/dio_base_repository.dart';

class CreateAccountRepository extends BaseRepository {
  Future<Response> createAccount(FormData formData) async {
    var result = postDataToServer(
      ApiEndpoint.createAccount,
      formData,
      needsAuthorization: false,
    );
    return result;
  }
}

final CreateAccountRepository createAccountRepository = CreateAccountRepository();