import 'package:covid_19/constant.dart';
import 'package:covid_19/widgets/my_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyHeader(
            image: "assets/icons/coronadr.svg",
            size: size,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Symptoms",
                  style: kTitleTextstyle,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SymptomCard(
                      image: "assets/images/headache.png",
                      title: "Symptoms",
                      isActive: true,
                    ),
                    SymptomCard(
                      image: "assets/images/caugh.png",
                      title: "Cough",
                      isActive: false,
                    ),
                    SymptomCard(
                      image: "assets/images/fever.png",
                      title: "Fever",
                      isActive: false,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Prevention",
                  style: kTitleTextstyle,
                ),
                SizedBox(
                  height: 20,
                ),
                PreventCard(size: size),
                PreventCard(size: size)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PreventCard extends StatelessWidget {
  const PreventCard({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 8), blurRadius: 24, color: kShadowColor)
                ]),
          ),
          Image.asset("assets/images/wear_mask.png"),
          Positioned(
            left: 130,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              height: 136,
              width: size.width - 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Wear a face mask",
                    style: kTitleTextstyle.copyWith(fontSize: 16),
                  ),
                  Text(
                    "Since the start of the corona virus some place have fully recovered",
                    style: TextStyle(fontSize: 12),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset("assets/icons/forward.svg")),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;

  const SymptomCard({
    Key key,
    this.image,
    this.title,
    this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            isActive
                ? BoxShadow(
                    offset: Offset(0, 10),
                    color: kActiveShadowColor,
                    blurRadius: 20)
                : BoxShadow(
                    offset: Offset(0, 3), blurRadius: 6, color: kShadowColor)
          ]),
      child: Column(
        children: [
          Image.asset(image),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
