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
      home: Highscores(),
    );
  }
}

class Highscores extends StatefulWidget {
  @override
  State<Highscores> createState() => _HighscoresState();
}

class _HighscoresState extends State<Highscores> {
  final List<String> items3 = [
    'All',
    'Knights',
    'Paladins',
    'Sorcerers',
    'Druids',
  ];

  final List<String> items2 = [
    'Experience',
    'Axe',
    'Club',
    'Sword',
    'Distance',
    'Shielding',
    'Magic Level',
    'Fist',
    'Fishing',
    'Achievements',
    'Charm',
    'Loyalty',
  ];
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

  String? selectedValue;
  String? selectedValue2;
  String? selectedValue3;

  String world = '';
  String category = '';
  String vocation = '';

  bool loading = false;

  int encontrou = 0;
  int charLevel = -1;

  dynamic charName = '';
  dynamic charVoc = '';
  dynamic charWorld = '';
  dynamic charSkill = '';

  dynamic charNames = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
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

  dynamic charVocs = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
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

  dynamic charLevels = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
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

  dynamic charSkills = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
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

  dynamic tibiaData;

  String url = '';

  void refresh() {
    setState(() {
      print('Refresh na página');
    });
  }

  buscar() async {
    if (category == 'Axe') category = 'axefighting';
    if (category == 'Club') category = 'clubfighting';
    if (category == 'Sword') category = 'swordfighting';
    if (category == 'Distance') category = 'distancefighting';
    if (category == 'Magic Level') category = 'magiclevel';
    if (category == 'Charm') category = 'charmpoints';
    if (category == 'Fist') category = 'fistfighting';
    if (category == 'Loyaty') category = 'loyatypoints';

    url = 'https://api.tibiadata.com/v3/highscores/$world/$category/$vocation';

    Network api = Network(url);

    tibiaData = await api.getData();

    charName = tibiaData['highscores']['highscore_list'][0]['name'];
    charLevel = tibiaData['highscores']['highscore_list'][0]['level'];
    charWorld = tibiaData['highscores']['highscore_list'][0]['world'];
    charVoc = tibiaData['highscores']['highscore_list'][0]['vocation'];
    charSkill = tibiaData['highscores']['highscore_list'][0]['value'];

    for (int i = 1; i <= 20; i++) {
      charNames[i] = tibiaData['highscores']['highscore_list'][i]['name'];
      //print(charNames[i]);
    }
    for (int i = 1; i <= 20; i++) {
      charLevels[i] =
          tibiaData['highscores']['highscore_list'][i]['level'].toString();
      //print(charLevels[i]);
    }
    for (int i = 1; i <= 20; i++) {
      charVocs[i] = tibiaData['highscores']['highscore_list'][i]['vocation'];
      //print(charVocs[i]);
    }
    for (int i = 1; i <= 20; i++) {
      charSkills[i] =
          tibiaData['highscores']['highscore_list'][i]['value'].toString();
      //print(charSkills[i]);
    }

    if (charSkill != '') {
      encontrou = 1;
    } else {
      encontrou = 0;
    }

    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('HIGHSCORES'),
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
                    'Highscores Page',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Select the World:',
                    style: TextStyle(
                      color: Color(0xff123456),
                      fontSize: 20,
                    ),
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
                  Text(
                    'Select the Skill Category:',
                    style: TextStyle(
                      color: Color(0xff123456),
                      fontSize: 20,
                    ),
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
                        items: items2
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
                        value: selectedValue2,
                        onChanged: (value) {
                          setState(() {
                            selectedValue2 = value as String;
                            category = selectedValue2!;
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
                  Text(
                    'Select the Vocation:',
                    style: TextStyle(
                      color: Color(0xff123456),
                      fontSize: 20,
                    ),
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
                        items: items3
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
                        value: selectedValue3,
                        onChanged: (value) {
                          setState(() {
                            selectedValue3 = value as String;
                            vocation = selectedValue3!;
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
                      if (world != '' && category != '' && vocation != '') {
                        setState(() async {
                          setState(() => loading = true);
                          buscar();
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
                    label: Text('GO'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (encontrou == 1)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Name: $charName',
                          style: dadosChar,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Level: $charLevel',
                          style: dadosChar,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Voc: $charVoc',
                          style: dadosChar,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Skill: $charSkill',
                          style: dadosChar,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '--------------------',
                          style: dadosChar,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        rank(charNames[1], charLevels[1], charVocs[1],
                            charSkills[1]),
                        rank(charNames[2], charLevels[2], charVocs[2],
                            charSkills[2]),
                        rank(charNames[3], charLevels[3], charVocs[3],
                            charSkills[3]),
                        rank(charNames[4], charLevels[4], charVocs[4],
                            charSkills[4]),
                        rank(charNames[5], charLevels[5], charVocs[5],
                            charSkills[5]),
                        rank(charNames[6], charLevels[6], charVocs[6],
                            charSkills[6]),
                        rank(charNames[7], charLevels[7], charVocs[7],
                            charSkills[7]),
                        rank(charNames[8], charLevels[8], charVocs[8],
                            charSkills[8]),
                        rank(charNames[9], charLevels[9], charVocs[9],
                            charSkills[9]),
                        rank(charNames[10], charLevels[10], charVocs[10],
                            charSkills[10]),
                        rank(charNames[11], charLevels[11], charVocs[11],
                            charSkills[11]),
                        rank(charNames[12], charLevels[12], charVocs[12],
                            charSkills[12]),
                        rank(charNames[13], charLevels[13], charVocs[13],
                            charSkills[13]),
                        rank(charNames[14], charLevels[14], charVocs[14],
                            charSkills[14]),
                        rank(charNames[15], charLevels[15], charVocs[15],
                            charSkills[15]),
                        rank(charNames[16], charLevels[16], charVocs[16],
                            charSkills[16]),
                        rank(charNames[17], charLevels[17], charVocs[17],
                            charSkills[17]),
                        rank(charNames[18], charLevels[18], charVocs[18],
                            charSkills[18]),
                        rank(charNames[19], charLevels[19], charVocs[19],
                            charSkills[19]),
                      ],
                    ),
                  if (loading) spinkit,
                  SizedBox(
                    height: 20,
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
