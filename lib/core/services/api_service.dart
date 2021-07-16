import 'dart:convert';

import 'package:cowin/core/models/session_model.dart';
import 'package:cowin/core/services/http_service.dart';

class ApiService {
  final HttpService httpService;

  ApiService({
    required this.httpService,
  });

  Future<List<Centers>> getCenters(String pincode, String date) async {
    List<Centers> centers = [];
    Map<String, dynamic> response = await httpService.makeGetRequest(
      url:
          'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByPin?pincode=$pincode&date=$date',
    );
    SessionModel sessions = SessionModel.fromJson(response);
    sessions.centers!.forEach((element) {
      centers.add(element);
    });
    return centers;
  }
}
