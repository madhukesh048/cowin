import 'dart:convert';

import 'package:cowin/core/models/session.dart';
import 'package:cowin/core/services/http_service.dart';

class ApiService {
  final HttpService httpService;

  ApiService({
    required this.httpService,
  });

  Future<List<Centers>> getSessions() async {
    List<Centers> below45 = [];
    String response = await httpService.makeGetRequest(
      url:
          'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByPin?pincode=560003&date=15-07-2021',
    );
    Map<String, dynamic> map = jsonDecode(response);
    SessionModel sessions = SessionModel.fromJson(map);
    sessions.centers!.forEach((element) {
      element.sessions!.forEach((session) {
        if (session.minAgeLimit! < 45 && session.availableCapacity! > 0) {
          if (below45.contains(element)) {
            return null;
          } else {
            below45.add(element);
          }
        }
      });
    });
    print(below45);
    return below45;
  }
}
