import 'package:covid_19/constant.dart';
import 'package:covid_19/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHeader extends StatelessWidget {
  final String image;
  final String textTop;
  final String textBottom;

  const MyHeader({
    Key key,
    @required this.size,
    this.image,
    this.textTop,
    this.textBottom,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 50, right: 20),
        height: size.height * .35,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xFF404D1C), Color(0xFF404D1C)]),
            image: DecorationImage(
                image: AssetImage(
              "assets/images/virus.png",
            ))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset("assets/icons/menu.svg")),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Stack(
                children: [
                  SvgPicture.asset(
                    image,
                    width: 220,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Positioned(
                    top: 20,
                    left: 140,
                    child: Text(
                      "All you \n need is stay \n at home",
                      style: kHeadingTextStyle.copyWith(color: Colors.white),
                    ),
                  ),
                  Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
