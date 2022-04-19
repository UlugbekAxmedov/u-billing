import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final appBarLeading = Padding(
  padding: const EdgeInsets.fromLTRB(20, 14, 13, 12),
  child: Container(
    decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(transform: GradientRotation(pi / 5), colors: [
          Color(0xFF00FFC2),
          Color(0xFF0500FF),
          Color(0xFFFFC700),
          Color(0xFFAD00FF),
          Color(0xFF00FF94),
        ])),
  ),
);

const lightGreen = Color(0xFF00A795);

const dark = Color(0xFF2A2A2D);

const darkGreen = Color(0xFF008F7F);

const red = Color(0xFFFF426D);