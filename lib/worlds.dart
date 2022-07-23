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
      home: Worlds(),
    );
  }
}

class Worlds extends StatefulWidget {
  @override
  State<Worlds> createState() => _WorldsState();
}

class _WorldsState extends State<Worlds> {
  String playerName = '';

  bool loading = false;

  int encontrou = 0;

  dynamic tibiaData;
  dynamic allPlayersOnline;

  dynamic worldName = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  dynamic worldStatus = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  dynamic worldType = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  dynamic worldPlayers = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  dynamic worldLocation = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  String url = '';

  void refresh() {
    setState(() {
      print('Refresh na página');
    });
  }

  buscar() async {
    url = 'https://api.tibiadata.com/v3/worlds';

    Network api = Network(url);

    tibiaData = await api.getData();

    allPlayersOnline = tibiaData['worlds']['players_online'].toString();

    worldName[0] = tibiaData['worlds']['regular_worlds'][0]['name'];
    worldPlayers[0] =
        tibiaData['worlds']['regular_worlds'][0]['players_online'].toString();
    worldStatus[0] = tibiaData['worlds']['regular_worlds'][0]['status'];
    worldType[0] = tibiaData['worlds']['regular_worlds'][0]['pvp_type'];
    worldLocation[0] = tibiaData['worlds']['regular_worlds'][0]['location'];

    for (int i = 1; i <= 80; i++) {
      worldName[i] = tibiaData['worlds']['regular_worlds'][i]['name'];
    }

    for (int i = 1; i <= 80; i++) {
      worldPlayers[i] =
          tibiaData['worlds']['regular_worlds'][i]['players_online'].toString();
    }

    for (int i = 1; i <= 80; i++) {
      worldStatus[i] = tibiaData['worlds']['regular_worlds'][i]['status'];
    }

    for (int i = 1; i <= 80; i++) {
      worldType[i] = tibiaData['worlds']['regular_worlds'][i]['pvp_type'];
    }

    for (int i = 1; i <= 80; i++) {
      worldLocation[i] = tibiaData['worlds']['regular_worlds'][i]['location'];
    }

    if (tibiaData != -1) {
      encontrou = 1;
      print('Deu ceto');
    } else {
      encontrou = -1;
      print('Não deu certo');
    }
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('WORLDS'),
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
                    'WORLDS',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (loading) spinkit,
                  SizedBox(
                    height: 20,
                  ),
                  if (encontrou == 1)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: charsOnline,
                            children: <TextSpan>[
                              new TextSpan(text: 'Players Online in Tibia: '),
                              new TextSpan(
                                text: allPlayersOnline,
                                style: charsOnline2,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'World Name: ${worldName[0]}',
                          style: worlds,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Status: ${worldStatus[0]}',
                          style: worlds,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Players Online: ${worldPlayers[0]}',
                          style: worlds,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'World Type: ${worldType[0]}',
                          style: worlds,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Location: ${worldLocation[0]}',
                          style: worlds,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '--------------------',
                          style: worlds,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        for (int i = 1; i <= 80; i++)
                          world(worldName[i], worldStatus[i], worldPlayers[i],
                              worldType[i], worldLocation[i]),
                      ],
                    ),
                  if (encontrou == -1)
                    Column(
                      children: [
                        Text(
                          'Error searching Tibia Worlds',
                          style: dadosChar,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      setState(() async {
                        setState(() => loading = true);
                        buscar();
                        await Future.delayed(Duration(seconds: 1));
                        setState(() => loading = false);
                        await Future.delayed(Duration(seconds: 1));
                        refresh();
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
                      Icons.add_circle,
                      size: 40,
                    ),
                    label: Text('Search all Worlds'),
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
