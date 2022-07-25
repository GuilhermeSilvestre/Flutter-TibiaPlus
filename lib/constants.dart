import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const Menu = TextStyle(
  color: Color(0xff500000),
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

const subMenus = TextStyle(
  color: Color(0xff900000),
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

const dadosChar = TextStyle(
  color: Color(0xff900000),
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

const charsOnline = TextStyle(
  color: Color(0xffbd1713),
  fontSize: 23,
  fontWeight: FontWeight.bold,
);

const charsOnline2 = TextStyle(
  color: Color(0xff03c04a),
  fontSize: 23,
  fontWeight: FontWeight.bold,
);

const worldInfo = TextStyle(
  color: Color(0xff2a7a80),
  fontSize: 23,
  fontWeight: FontWeight.bold,
);

const worlds = TextStyle(
  color: Color(0xff4566c5),
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

const spinkit = SpinKitPouringHourGlassRefined(
  color: Color(0xff823983),
  size: 80.0,
);

Column rank(name, level, voc, skil) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Name: $name',
        style: dadosChar,
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        'Level: $level',
        style: dadosChar,
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        'Voc: $voc',
        style: dadosChar,
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        'Skill: $skil',
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
    ],
  );
}

Column world(name, status, players, type, location) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'World Name: $name',
        style: worlds,
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'Status: $status',
        style: worlds,
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'Players Online: $players',
        style: worlds,
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'World Type: $type',
        style: worlds,
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'Location: $location',
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
    ],
  );
}

Column worldPlayersSearch(name, level, voc) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'World Name: $name',
        style: worlds,
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'Level: $level',
        style: worlds,
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'Vocation: $voc',
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
        height: 10,
      ),
    ],
  );
}
