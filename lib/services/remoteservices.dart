import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:kabitaab/models/poem.dart';
import 'package:kabitaab/models/random_model.dart';
import 'package:http/http.dart' as http;
import 'package:kabitaab/models/title.dart';

import '../models/author_model.dart';

class ApiService {
  static String url = "https://poetrydb.org/";
  Future<List<Random>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('https://poetrydb.org/random');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return randomFromJson(json);
    }
  }

  static getPoem(String poemTitle) async {
    String url = "https://poetrydb.org/";
    var response = await http.get(Uri.parse(url + "title" + "/" + poemTitle));
    // print(response.body);
    if (response.statusCode == 200) {
      var jsondata = jsonDecode(response.body);
      // print(jsondata[1]['title']);

      return Poem(
        title: jsondata[0]['title'],
        author: jsondata[0]['author'],
        lines: jsondata[0]['lines'],
        lineCount: jsondata[0]['linecount'],
      );
    } else {
      throw Exception("Unable to get data");
    }
  }

  static getAllTitle() async {
    var response = await http.get(Uri.parse(url + "/" + "titles"));

    if (response.statusCode == 200) {
      var jsonTitles = jsonDecode(response.body);
      List<MyTitle> titleList = [];
      // print(jsonTitles["titles"]);
      for (int i = 0; i < jsonTitles["titles"].length; i++) {
        MyTitle title = MyTitle(title: jsonTitles["titles"][i]);
        titleList.add(title);
      }
      return titleList;
    } else {
      throw Exception("no data");
    }
  }

  static getTitle(String authorName) async {
    String url = "https://poetrydb.org/";
    var response =
        await http.get(Uri.parse(url + "author" + "/" + authorName + "/title"));

    if (response.statusCode == 200) {
      var jsondata = jsonDecode(response.body);
      // print(jsondata[1]['title']);
      // print(jsondata.length);
      List<MyTitle> titleData = [];

      for (int i = 0; i < jsondata.length; i++) {
        MyTitle title = MyTitle(title: jsondata[i]['title']);
        titleData.add(title);
      }

      return titleData;
    } else {
      throw Exception("Unable to get data");
    }
  }
}

getAuthor() async {
  String baseUrl = "https://poetrydb.org/";
  String author = "author";
  var uri = Uri.parse(baseUrl + author);

  var apiresponse = await http.get(uri);
  // print(apiresponse.body);

  if (apiresponse.statusCode == 200) {
    var jsondata = jsonDecode(apiresponse.body);
    // print(jsondata['authors']);
    List myauthors = [];

    // print(myauthors);

    for (var author in jsondata['authors']) {
      MyAuthor authorFav = MyAuthor(name: author);
      myauthors.add(authorFav);
    }
    return myauthors;

    // print(myauthors.toString());

    // print(apiresponse.body);
  }
}
