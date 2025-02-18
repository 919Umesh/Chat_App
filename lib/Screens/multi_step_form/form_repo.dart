import 'package:dio/dio.dart';

import '../../base/Api_end_point/api_endpoints.dart';
import '../../base/Dio_services/dio_base_repository.dart';


class CreateFromRepository extends BaseRepository {
  Future<Response> createForm({required FormData form,}) async {
    return await postDataToServerTest(
      ApiEndpoint.getNotes,
      needsAuthorization: false,
      iSJsonDataHeaderType: true,
    );
  }
}

final CreateFromRepository createFromRepository = CreateFromRepository();