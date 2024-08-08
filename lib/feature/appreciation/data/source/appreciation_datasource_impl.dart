import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../../../core/core.dart';
import '../../appreciation.dart';

class AppreciationDataSourceImpl implements AppreciationDataSource {
  const AppreciationDataSourceImpl(this._client);

  final http.Client _client;

  @override
  Future<void> appreciationRequest(DataMap body) async {
    try {
      final urlParse = Uri.parse(ApiUrl.createAppreciationEndPoints);
      final token = SharedPrefs().getToken();
      final response = await _client.post(urlParse,
          headers: {'content-type': 'application/json', 'token': token},
          body: jsonEncode(body));

      final jsonResponse = jsonDecode(response.body);
      Logger().d(jsonResponse.toString());
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw APIException(
            message: response.body, statusCode: response.statusCode);
      }
      if (jsonResponse == null) {
        throw APIException(
          message: jsonDecode(response.body)["message"].toString(),
          statusCode: response.statusCode,
        );
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<EmployeeUserModel> employeeUserList() async {
    try {
      final urlParse = Uri.parse(ApiUrl.createAppreciationEndPoints);
      final token = SharedPrefs().getToken();
      final response = await _client.post(urlParse,
          headers: {'content-type': 'application/json', 'token': token});
      Logger().t(response.body);
      final jsonResponse = jsonDecode(response.body);

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw APIException(
            message: response.body, statusCode: response.statusCode);
      }
      if (jsonResponse == null) {
        throw APIException(
          message: jsonDecode(response.body)["message"].toString(),
          statusCode: response.statusCode,
        );
      }
      return EmployeeUserModel.fromJson(jsonResponse);
    } on APIException {
      rethrow;
    } catch (e) {
      Logger().e(e);
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }
}
