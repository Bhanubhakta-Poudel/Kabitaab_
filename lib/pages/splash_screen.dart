import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kabitaab/pages/home_screen.dart';
import 'package:kabitaab/utilities/colors.dart';
import 'package:kabitaab/widgets/container.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 80),
                child: Text(
                  "Kabitaab",
                  style: GoogleFonts.styleScript(
                      fontStyle: FontStyle.italic,
                      fontSize: 90,
                      color: textColor),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Center(
                  child: Image.asset(
                    "assets/images/kabita.png",
                    width: 300,
                    height: 200,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Center(
                  child: Text(
                    "Bhanubhakta Poudel",
                    style: GoogleFonts.styleScript(
                        fontStyle: FontStyle.italic,
                        fontSize: 30,
                        color: textColor),
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text.rich(
                  TextSpan(
                    text:
                        "An app to read all your mind bogglig poems. Get into the habit of reading something nice",
                    style: GoogleFonts.styleScript(
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: NewWidget(),
              )
            ],
          )
        ],
      ),
    );
  }
}
