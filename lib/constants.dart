import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.white, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: '',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kConstantColourWhite, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kConstantColourPurple, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kConstantColourGreen = Color(0XFF5CFBBF);
const kConstantColourPurple = Color(0XFF3225F2);
const kConstantColourWhite = Colors.white;
const kConstantColourNavy = Color(0XFF010817);
const kConstantColourRed = Colors.red;
const kConstantColourBlue = Colors.blue;
const kConstantColourDarkGreen = Color(0xFF2C5A61);
const kConstantColourDarkBlue = Color(0xFF274CF8);
const kConstantColourOrange = Color(0xFFE46F71);
const kConstantColourSoftBlue = Color(0xFF21357F);
const kConstantColourDeepBlue = Color(0XFF254EF8);
const kConstantColourDeepPurple = Color(0XFFBD4FDC);
const kConstantColourStrongRed = Color(0XFFCC1112);
const kConstantColourGrey = Color(0xFF222222);
