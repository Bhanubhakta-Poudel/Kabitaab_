import 'package:flutter/material.dart';
import 'package:kabitaab/models/random_model.dart';
import 'package:kabitaab/services/remoteservices.dart';

import '../utilities/colors.dart';

class Poemlist extends StatefulWidget {
  static const poemlist = "haleooe";
  Poemlist({Key? key}) : super(key: key);

  @override
  State<Poemlist> createState() => _PoemlistState();
}

class _PoemlistState extends State<Poemlist> {
  List<Random>? randoms;
  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    randoms = await ApiService().getPosts();
    if (randoms != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return randoms != null
        ? ListView.builder(
            itemCount: randoms?.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                // color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.all(10),
                color: textbackground,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        randoms![index].title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textScaleFactor: 1.2,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 150.0),
                        child: Text(
                          randoms![index].author,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Text(
                      //   randoms![index].lines.toString(),
                      //   style: TextStyle(
                      //       fontSize: 18, fontWeight: FontWeight.w400),
                      // ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        width: double.maxFinite,
                        child: ListView.builder(
                            itemCount: int.parse(randoms![index].linecount),
                            itemBuilder: (context, i) => Text(
                                  randoms![index].lines[i],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                )),
                      )
                    ],
                  ),
                ),
              );
            },
          )
        : Center(child: CircularProgressIndicator());
  }
}
