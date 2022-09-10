import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kabitaab/pages/by_artist.dart';
import 'package:kabitaab/pages/by_poem.dart';
import 'package:kabitaab/pages/by_title.dart';
import 'package:kabitaab/pages/random_poem.dart';
import 'package:kabitaab/services/remoteservices.dart';
import 'package:kabitaab/utilities/colors.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black, size: 50),
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            "Kabitaab",
            style: GoogleFonts.styleScript(
                fontStyle: FontStyle.italic, fontSize: 90, color: textColor),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_active,
              size: 35,
            ),
          )
        ],
      ),
      body: Poemlist(),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(250, 252, 115, 128),
        child: ListView(
          children: [
            Center(
              child: Text(
                "Kabitaab",
                style: GoogleFonts.styleScript(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    fontSize: 40,
                    color: textColor),
              ),
            ),
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: CircleAvatar(
                radius: 10,
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/kabita.png",
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                "Search By Authors",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ByArtist()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.article),
              title: Text(
                "Search By Tittles",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ByTitle(
                            apiCallFunction: ApiService.getAllTitle(),
                          )),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.equalizer_outlined),
              title: Text(
                "Progress Report",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              // onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => const ByPoem()),
              //   );
              // },
            ),
            Divider(
              thickness: 0.50,
              color: Colors.green,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("App Related",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text(
                "Share the App",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              // onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => const ByPoem()),
              //   );
              // },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text(
                "Rate the App",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              // onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => const ByPoem()),
              //   );
              // },
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text(
                "About Us",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              // onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => const ByPoem()),
              //   );
              // },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(
                "Exit",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
