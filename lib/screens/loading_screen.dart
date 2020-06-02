import 'package:covid_19/main.dart';
import 'package:covid_19/services/covid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  @override
  void initState() {
    super.initState();
    getCovidSummary();
  }

  void getCovidSummary() async {
    try {
      CovidService covidService = CovidService();
      var data = await covidService.getAllSummary(
          recovered: "recovered", deaths: "deaths", confirmed: "confirmed");
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomeScreen(
          covidConfirmed: data['confirmed'],
          recoveredCases: data['recoveries'],
          covidDeaths: data['deaths'],
        );
      }));
    } catch (e) {
      print("there was an error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      )),
    );
  }
}
