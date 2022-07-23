import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'network.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'highscores.dart';
import 'worlds.dart';
import 'world.dart';

final GlobalKey<ScaffoldState> abrirMenu = GlobalKey();

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];

  String playerName = '';

  dynamic auxDateCreated = '';
  dynamic auxDateLastLogin = '';

  bool loading = false;

  int encontrou = 0;
  int charLevel = -1;

  dynamic charName = '';
  dynamic charSex = '';
  dynamic charVoc = '';
  dynamic charWorld = '';
  dynamic charComment = '';
  dynamic charCreated = '';
  dynamic charLastLogin = '';
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
      charComment = tibiaData['characters']['character']['comment'];
      charAccStatus = tibiaData['characters']['character']['account_status'];
      charLastLogin = tibiaData['characters']['character']['last_login'];
      charCreated = tibiaData['characters']['account_information']['created'];
    } else {
      encontrou = -1;
      print('Não encontrou nenhum char');
    }
    if (charCreated == null) {
      charCreated = 'Hidden field.';
    } else {
      charCreated = charCreated.substring(0, charCreated.indexOf('T'));
      charCreated = charCreated.replaceAll('-', '/');
    }
    if (charLastLogin == null) {
      charLastLogin = 'Hidden field.';
    } else {
      charLastLogin = charLastLogin.substring(0, charLastLogin.indexOf('T'));
      charLastLogin = charLastLogin.replaceAll('-', '/');
    }
    if (charComment == null) {
      charComment = 'No comment';
    }
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: abrirMenu,
      drawer: Container(
        width: MediaQuery.of(context).size.width / (1.25),
        height: MediaQuery.of(context).size.height / (1.1),
        child: Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          backgroundColor: Colors.amber[100],
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 100,
                child: DrawerHeader(
                  child: Text(
                    'MENU',
                    textAlign: TextAlign.center,
                    style: Menu,
                  ),
                  decoration: BoxDecoration(),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                //color: palette3,
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Highscores();
                        },
                      ),
                    );
                  },
                  title: Text(
                    'Highscores',
                    style: subMenus,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Worlds();
                        },
                      ),
                    );
                  },
                  title: Text(
                    'Worlds',
                    style: subMenus,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                //color: palette3,
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return World();
                        },
                      ),
                    );
                  },
                  title: Text(
                    'World (specific)',
                    style: subMenus,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: Text(
                    'CLOSE MENU',
                    textAlign: TextAlign.center,
                    style: Menu,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('TIBIA PLUS'),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            abrirMenu.currentState!.openDrawer();
          },
          child: const Icon(
            Icons.menu_rounded,
          ),
        ),
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
                    'This is the Tibia Plus APP',
                    style: Theme.of(context).textTheme.headline6,
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
                          'Name: $charName',
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
                          'Vocation: $charVoc',
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
                          'Comment: $charComment',
                          style: dadosChar,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Created: $charCreated',
                          style: dadosChar,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Last login: $charLastLogin',
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
                    child: SizedBox(
                      width: 310,
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp("[a-zA-Z ]"),
                              allow: true),
                        ],
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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (playerName.length != 0 && playerName[0] != ' ') {
                        setState(() async {
                          setState(() => loading = true);
                          buscarChar();
                          await Future.delayed(Duration(seconds: 1));
                          setState(() => loading = false);
                          await Future.delayed(Duration(seconds: 1));
                          refresh();
                        });
                      }
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
