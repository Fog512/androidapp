import 'package:covid_19_app_ui/constants.dart';
import 'package:covid_19_app_ui/widgets/counter.dart';
import 'package:covid_19_app_ui/widgets/info_screen.dart';
import 'package:covid_19_app_ui/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid-19 App',
        theme: ThemeData(
            scaffoldBackgroundColor: kBackgroundColor,
            fontFamily: "Poppins",
            textTheme: TextTheme(
              bodyText1: TextStyle(color: kBodyTextColor),
            )),
        home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          MyHeader(
            image: "assets/icons/Drcorona.svg",
            textTop: "All you need",
            textBottom: "is stay home.",
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Color(0xFFE5E5E5),
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: DropdownButton(
                  isExpanded: true,
                  underline: SizedBox(),
                  value: "Viet Nam",
                  items: ['Viet Nam', 'Indonesia', 'United States', 'JaPan']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {},
                ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Case Update \n", style: kTitleTextstyle),
                        TextSpan(
                          text: "Newest Update October 15",
                          style: TextStyle(color: kTextLightColor),
                        ),
                      ]),
                    ),
                    Spacer(),
                    Text(
                      "See details",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 30,
                            color: kShadowColor)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Counter(
                        color: kInfectedColor,
                        number: 853842,
                        title: 'Infected  ',
                      ),
                      Counter(
                        color: kRecovercolor,
                        number: 788005,
                        title: 'Recover',
                      ),
                      Counter(
                        color: kDeathColor,
                        number: 20950,
                        title: 'Deaths',
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Spread of Virus",
                      style: kTitleTextstyle,
                    ),
                    Text(
                      "See Details",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 30,
                          color: kShadowColor,
                        )
                      ]),
                  child: Image.asset(
                    "assets/images/vietnam.jpg",
                    fit: BoxFit.cover,
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
