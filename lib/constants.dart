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

Column ranking = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(
      'Name: ',
      style: dadosChar,
    ),
    SizedBox(
      height: 20,
    ),
    Text(
      'Level: ',
      style: dadosChar,
    ),
    SizedBox(
      height: 20,
    ),
    Text(
      'Voc: ',
      style: dadosChar,
    ),
    SizedBox(
      height: 20,
    ),
    Text(
      'Skill: ',
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
