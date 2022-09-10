import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kabitaab/models/author_model.dart';
import 'package:kabitaab/pages/by_title.dart';

import '../services/remoteservices.dart';
import '../utilities/colors.dart';

class ByArtist extends StatefulWidget {
  const ByArtist({Key? key}) : super(key: key);

  @override
  State<ByArtist> createState() => _ByArtistState();
}

class _ByArtistState extends State<ByArtist> {
  @override
  void initState() {
    getAuthor();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarColor,
        title: Center(
          child: Text("List of Authors"),
        ),
      ),
      body: FutureBuilder(
          future: getAuthor(),
          builder: <MyAuthor>(context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) => ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ByTitle(
                                        authorName: data[index].name,
                                        apiCallFunction: ApiService.getTitle(
                                            data[index].name),
                                      )));
                        },
                        title: Container(
                          height: 50,
                          child: Card(
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 10,
                            margin: EdgeInsets.all(5),
                            child: Center(
                                child: Text(
                              data[index].name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            )),
                          ),
                        ),
                      ));
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
