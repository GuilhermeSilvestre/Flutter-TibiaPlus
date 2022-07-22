import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'dart:convert';

class Network {
  Network(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      //print('Encontrou Character!');
      return jsonDecode(data);
    } else {
      //print('Erro ao tentar encontrar charcater!');
      print(response.statusCode);
      return -1;
    }
  }
}
