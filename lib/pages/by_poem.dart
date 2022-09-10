import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kabitaab/services/remoteservices.dart';
import 'package:kabitaab/utilities/colors.dart';

class ByPoem extends StatefulWidget {
  final String? poemName;
  const ByPoem({Key? key, this.poemName}) : super(key: key);

  @override
  State<ByPoem> createState() => _ByPoemState();
}

class _ByPoemState extends State<ByPoem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarColor,
        title: Center(child: Text("Poem")),
      ),
      // body: Container(
      //   child: Center(
      //     child: Text(
      //       ApiServices.authorlist.length.toString(),
      //     ),
      //   ),
      // ),
      body: FutureBuilder(
        future: ApiService.getPoem(widget.poemName!),
        builder: <Poem>(context, snapshot) {
          var data = snapshot.data;

          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  print(data.lineCount);
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.all(10),
                    color: textbackground,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            data.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textScaleFactor: 1.2,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 200.0),
                            child: Text(
                              data.author,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.7,
                            width: double.maxFinite,
                            child: ListView.builder(
                              itemCount: int.parse(data.lineCount),
                              itemBuilder: (context, index) {
                                return Text(
                                  data.lines[index],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                );
                              },
                            ),
                          ),

                          // Text(data.poem[index].content),
                        ],
                      ),
                    ),
                  );
                });
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
