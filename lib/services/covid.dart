import 'package:covid_19/services/networking.dart';

class CovidService {
  // get a summary of all cases
  Future<dynamic> getAllSummary(
      {String confirmed, String deaths, String recovered}) async {
    dynamic confirmed;
    dynamic deaths;
    dynamic recovered;
    confirmed = await func("confirmed", confirmed);
    deaths = await func("deaths", deaths);
    recovered = await func("recovered", recovered);

    return {"confirmed": confirmed, "deaths": deaths, "recoveries": recovered};
  }

  Future<dynamic> func(String suffix, dynamic returned) async {
    var url = 'https://api.covid19api.com/total/country/kenya/status/$suffix';
    NetWorkHelper netWorkHelper = NetWorkHelper(url: url);
    List<dynamic> data = await netWorkHelper.getData();
    print(data);
    returned = data.last['Cases'];
    return returned;
  }
}
