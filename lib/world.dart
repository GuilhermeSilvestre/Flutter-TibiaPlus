import 'dart:io';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'network.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

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
      home: World(),
    );
  }
}

class World extends StatefulWidget {
  @override
  State<World> createState() => _WorldState();
}

class _WorldState extends State<World> {
  String playerName = '';

  bool loading = false;

  int encontrou = 0;

  dynamic tibiaData;
  dynamic allPlayersOnlineName = List.filled(1000, 'players');
  dynamic allPlayersOnlineLevel = List.filled(1000, 'levels');
  dynamic allPlayersOnlineVoc = List.filled(1000, 'vocations');

  String? selectedValue;

  String world = '';

  final List<String> items = [
    'Adra',
    'Alumbra',
    'Antica',
    'Ardera',
    'Astera',
    'Axera',
    'Bastia',
    'Batabra',
    'Belobra',
    'Bombra',
    'Bona',
    'Cadebra',
    'Calmera',
    'Castela',
    'Celebra',
    'Celesta',
    'Collabra',
    'Damora',
    'Descubra',
    'Dibra',
    'Epoca',
    'Esmera',
    'Famosa',
    'Fera',
    'Ferobra',
    'Firmera',
    'Gentebra',
    'Gladera',
    'Harmonia',
    'Havera',
    'Honbra',
    'Illusera',
    'Impulsa',
    'Inabra',
    'Issobra',
    'Kalibra',
    'Karna',
    'Libertabra',
    'Lobera',
    'Luminera',
    'Lutabra',
    'Marbera',
    'Marcia',
    'Menera',
    'Monza',
    'Mudabra',
    'Mykera',
    'Nadora',
    'Nefera',
    'Nossobra',
    'Ocera',
    'Olimpa',
    'Ombra',
    'Optera',
    'Pacera',
    'Peloria',
    'Premia',
    'Quelibra',
    'Quintera',
    'Refugia',
    'Reinobra',
    'Seanera',
    'Secura',
    'Serdebra',
    'Solidera',
    'Suna',
    'Telera',
    'Tembra',
    'Thyria',
    'Trona',
    'Utobra',
    'Venebra',
    'Versa',
    'Visabra',
    'Vunira',
    'Wintera',
    'Wizera',
    'Xandebra',
    'Yonabra',
    'Zenobra',
    'Zuna',
    'Zunera',
  ];

  dynamic worldName;
  dynamic worldStatus;
  dynamic worldType;
  dynamic worldPlayers;
  dynamic worldLocation;
  dynamic worldRecordPlyers;
  dynamic worldCreationDate;

  String url = '';

  void refresh() {
    setState(() {
      print('Refresh na página');
    });
  }

  buscar() async {
    url = 'https://api.tibiadata.com/v3/world/$world';

    Network api = Network(url);

    tibiaData = await api.getData();

    worldName = tibiaData['worlds']['world']['name'];

    worldPlayers = tibiaData['worlds']['world']['players_online'].toString();

    worldStatus = tibiaData['worlds']['world']['status'];
    worldType = tibiaData['worlds']['world']['pvp_type'];
    worldLocation = tibiaData['worlds']['world']['location'];
    worldRecordPlyers = tibiaData['worlds']['world']['record_players'];
    worldCreationDate = tibiaData['worlds']['world']['creation_date'];

    for (int i = 0;
        i <= tibiaData['worlds']['world']['online_players'].length - 1;
        i++) {
      allPlayersOnlineName[i] =
          tibiaData['worlds']['world']['online_players'][i]['name'];

      allPlayersOnlineLevel[i] =
          tibiaData['worlds']['world']['online_players'][i]['level'].toString();

      allPlayersOnlineVoc[i] =
          tibiaData['worlds']['world']['online_players'][i]['vocation'];
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
        title: Text('WORLD'),
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
                    'Choose a world',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (loading) spinkit,
                  if (loading)
                    SizedBox(
                      height: 20,
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 180,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Row(
                          children: const [
                            Icon(
                              Icons.list,
                              size: 16,
                              color: Colors.yellow,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                'Select Item',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value as String;
                            world = selectedValue!;
                            //print(world);
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                        iconSize: 14,
                        iconEnabledColor: Colors.yellow,
                        iconDisabledColor: Colors.grey,
                        buttonHeight: 50,
                        buttonWidth: 160,
                        buttonPadding:
                            const EdgeInsets.only(left: 14, right: 14),
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.black26,
                          ),
                          color: Colors.redAccent,
                        ),
                        buttonElevation: 2,
                        itemHeight: 40,
                        itemPadding: const EdgeInsets.only(left: 14, right: 14),
                        dropdownMaxHeight: 200,
                        dropdownWidth: 200,
                        dropdownPadding: null,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.redAccent,
                        ),
                        dropdownElevation: 8,
                        scrollbarRadius: const Radius.circular(40),
                        scrollbarThickness: 6,
                        scrollbarAlwaysShow: true,
                        offset: const Offset(-20, 0),
                      ),
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
                    label: Text('Go'),
                  ),
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
                              new TextSpan(text: 'Info about the world: '),
                              new TextSpan(
                                text: worldName,
                                style: worldInfo,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'World Name: ${worldName}',
                          style: worlds,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Status: ${worldStatus}',
                          style: worlds,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Players Online: ${worldPlayers}',
                          style: worlds,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'World Type: ${worldType}',
                          style: worlds,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Location: ${worldLocation}',
                          style: worlds,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Record Players Online: ${worldRecordPlyers}',
                          style: worlds,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Creation Date: ${worldCreationDate}',
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
                        Text(
                          'Online Players list',
                          style: charsOnline,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        for (int i = 0;
                            i <=
                                tibiaData['worlds']['world']['online_players']
                                        .length -
                                    1;
                            i++)
                          worldPlayersSearch(allPlayersOnlineName[i],
                              allPlayersOnlineLevel[i], allPlayersOnlineVoc[i]),
                      ],
                    ),
                  if (encontrou == -1)
                    Column(
                      children: [
                        Text(
                          'Error searching Tibia World',
                          style: dadosChar,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
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
