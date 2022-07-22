import 'dart:io';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'network.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.amber[100],
      ),
      home: KillStatistics(),
    );
  }
}

class KillStatistics extends StatefulWidget {
  @override
  State<KillStatistics> createState() => _KillStatisticsState();
}

class _KillStatisticsState extends State<KillStatistics> {
  String playerName = '';

  bool loading = false;

  int encontrou = 0;
  int charLevel = -1;

  dynamic charName = '';
  dynamic charSex = '';
  dynamic charVoc = '';
  dynamic charWorld = '';
  dynamic charComment = 'Não possui comentário.';
  dynamic charCreated = 'Data de criação oculta';
  dynamic charLastLogin = 'Último login oculto';
  dynamic charAccStatus = '';

  dynamic tibiaData;

  String url = '';

  void refresh() {
    setState(() {
      print('Refresh na página');
    });
  }

  buscarChar() async {
    url = 'https://api.tibiadata.com/v3/character/$playerName';

    Network api = Network(url);

    tibiaData = await api.getData();

    charLevel = tibiaData['characters']['character']['level'];

    if (tibiaData != -1 && charLevel != 0) {
      encontrou = 1;
      print('Encontrou um char');
      charName = tibiaData['characters']['character']['name'];
      charLevel = tibiaData['characters']['character']['level'];
      charVoc = tibiaData['characters']['character']['vocation'];
      charSex = tibiaData['characters']['character']['sex'];
      charWorld = tibiaData['characters']['character']['world'];

      if (tibiaData['characters']['character']['comment'] != null) {
        charComment = tibiaData['characters']['character']['comment'];
      }
      if (tibiaData['characters']['character']['account_status'] != null) {
        charAccStatus = tibiaData['characters']['character']['account_status'];
      }
      if (tibiaData['characters']['character']['last_login'] != null) {
        charLastLogin = tibiaData['characters']['character']['last_login'];
      }
      if (tibiaData['characters']['account_information']['created'] != null) {
        charCreated = tibiaData['characters']['account_information']['created'];
      }
    } else {
      encontrou = -1;
      print('Não encontrou nenhum char');
    }
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('KILL STATISTICS'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, bottom: 8.0, left: 10.0, right: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'KILL STATISTICS',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Select the tibia character you are looking for:',
                    style: TextStyle(
                      color: Color(0xff123456),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (encontrou == 1)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nome: $charName',
                          style: dadosChar,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Status: $charAccStatus',
                          style: dadosChar,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Level: $charLevel',
                          style: dadosChar,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Sex: $charSex',
                          style: dadosChar,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Vocação: $charVoc',
                          style: dadosChar,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'World: $charWorld',
                          style: dadosChar,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Comentário: $charComment',
                          style: dadosChar,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Criado em: $charCreated',
                          style: dadosChar,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Último Login: $charLastLogin',
                          style: dadosChar,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  if (encontrou == -1)
                    Column(
                      children: [
                        Text(
                          'Não encontramos nenhum char',
                          style: dadosChar,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  if (loading) spinkit,
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      scrollPadding: EdgeInsets.only(bottom: 140),
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter character name',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) {
                        playerName = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      setState(() async {
                        setState(() => loading = true);
                        buscarChar();
                        await Future.delayed(Duration(seconds: 1));
                        setState(() => loading = false);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        220,
                        60,
                      ),
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    icon: Icon(
                      Icons.search,
                      size: 40,
                    ),
                    label: Text('Find Player'),
                  ),
                  Image.asset(
                    'images/tibiaicon.png',
                    width: 150,
                    height: 150,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
