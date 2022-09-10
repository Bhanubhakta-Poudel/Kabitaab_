import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kabitaab/pages/by_poem.dart';
import 'package:kabitaab/services/remoteservices.dart';
import 'package:kabitaab/utilities/colors.dart';

class ByTitle extends StatefulWidget {
  final String? authorName;
  final Future<dynamic>? apiCallFunction;
  ByTitle({Key? key, this.authorName, this.apiCallFunction}) : super(key: key);
  var data = [];

  @override
  State<ByTitle> createState() => _ByTitleState();
}

class _ByTitleState extends State<ByTitle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarColor,
        title: Center(
            child: Text(widget.authorName == null
                ? "List of Tittles"
                : widget.authorName!)),
      ),
      body: FutureBuilder(
        future: widget.apiCallFunction,
        builder: ((context, AsyncSnapshot snapshot) {
          var data = snapshot.data;

          if (snapshot.hasError) {
            return Text("Error ");
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ByPoem(
                                  poemName: data[index].title,
                                )));
                  },
                  title: Container(
                    height: 60,
                    child: Card(
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 10,
                      margin: EdgeInsets.all(5),
                      child: Center(
                          child: Text(
                        data[index].title,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      )),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
