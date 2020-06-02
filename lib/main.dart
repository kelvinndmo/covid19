import 'package:covid_19/constant.dart';
import 'package:covid_19/info_screen.dart';
import 'package:covid_19/screens/loading_screen.dart';
import 'package:covid_19/widgets/counter.dart';
import 'package:covid_19/widgets/my_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Poppins",
          textTheme: TextTheme(
            body1: TextStyle(color: kBodyTextColor),
          )),
      home: LoadingScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final int covidConfirmed;
  final int covidDeaths;
  final int recoveredCases;

  const HomeScreen(
      {Key key,
      @required this.covidConfirmed,
      @required this.covidDeaths,
      @required this.recoveredCases})
      : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int confirmedCases;
  int recoveredCases;
  int deathCases;
  String countryValue = "Kenya";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(
        covidConfirmed: widget.covidConfirmed,
        covidDeaths: widget.covidDeaths,
        covidRecovered: widget.recoveredCases);
  }

  //get data here
  void updateUI({int covidConfirmed, int covidDeaths, int covidRecovered}) {
    setState(() {
      confirmedCases = covidConfirmed;
      recoveredCases = covidRecovered;
      deathCases = covidDeaths;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          MyHeader(
            size: size,
            image: "assets/images/patient.png",
          ),
          CustomDropDownMenu(
            countries: [
              {"country": "Kenya", "value": "Kenya"},
              {"country": "Uganda", "value": "Uganda"},
            ],
            value: countryValue,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(text: "Case Update\n", style: kTitleTextstyle),
                        TextSpan(
                            text: "Newest update March 28",
                            style: TextStyle(color: kTextLightColor))
                      ]),
                    ),
                    Spacer(),
                    Text(
                      "See Details",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomDetailsCard(
                  confirmedCases: confirmedCases,
                  recoveredCases: recoveredCases,
                  deathCases: deathCases,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Spread of virus",
                      style: kTitleTextstyle,
                    ),
                    Text(
                      "see details",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 3),
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 30,
                            color: kShadowColor)
                      ]),
                  child: Image.asset(
                    "assets/images/covid.png",
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomDetailsCard extends StatelessWidget {
  final int confirmedCases;
  final int recoveredCases;
  final int deathCases;

  const CustomDetailsCard(
      {Key key,
      @required this.confirmedCases,
      @required this.deathCases,
      @required this.recoveredCases})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4), blurRadius: 30, color: kShadowColor)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Counter(
              color: Colors.purple,
              number: confirmedCases,
              title: "Infected",
            ),
            Counter(
              color: kDeathColor,
              number: deathCases,
              title: "Deaths",
            ),
            Counter(
              color: kRecovercolor,
              number: recoveredCases,
              title: "Recovered",
            )
          ],
        ));
  }
}

class CustomDropDownMenu extends StatefulWidget {
  final List<dynamic> countries;
  final String value;

  const CustomDropDownMenu({@required this.countries, this.value});

  @override
  State<StatefulWidget> createState() => _CustomDropDownMenu();
}

class _CustomDropDownMenu extends State<CustomDropDownMenu> {
  String value;
  List<dynamic> countries;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countries = widget.countries;
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Color(0xFFE5E5E5))),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/maps-and-flags.svg",
            color: Color(0xFF404D1C),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: DropdownButton(
                isExpanded: true,
                underline: SizedBox(),
                icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                value: value,
                onChanged: (valuee) {
                  setState(() {
                    value = valuee;
                  });
                },
                items:
                    countries.map<DropdownMenuItem<dynamic>>((dynamic value) {
                  return DropdownMenuItem<String>(
                    value: value['value'],
                    child: Text(value['value']),
                  );
                }).toList()),
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
