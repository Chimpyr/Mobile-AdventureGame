import 'package:shared_preferences/shared_preferences.dart';

export 'package:flutter/material.dart';
export 'main.dart';
export 'package:numberpicker/numberpicker.dart';
export 'package:provider/provider.dart';
export 'settings.dart';
export 'pages/questionImage.dart';
export 'package:SinbadsAdventure/provider/theme_provider.dart';
export 'pages/route1.dart';
export 'pages/route2.dart';
export 'pages/route3.dart';
export 'pages/route4.dart';
export 'pages/route5.dart';
export 'pages/ending1.dart';
export 'pages/ending2.dart';
export 'pages/ending3.dart';
export 'pages/ending4.dart';
export 'glassmorphism.dart';
export 'package:flutter_phoenix/flutter_phoenix.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:whatsapp_unilink/whatsapp_unilink.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:share_plus/share_plus.dart';
export 'package:flutter/services.dart';

int globalScore = 0;
int globalHighScore = 0;

void resetScore() {
  globalScore = 0;
  globalHighScore = 0;
}

int getScore() {
  return globalScore;
}

void increaseScore(score) {
  globalScore + score;
}

String keyHighscore = 'highScore';

//this function checks if the current highscore had been beaten, if it has then it will update it and save it on the device
void highScoreCheck() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  if (globalScore >= globalHighScore) {
    globalHighScore = globalScore;
    preferences.setInt(keyHighscore, globalScore);
    //globalHighScore = preferences.getInt("highscore")!;
  }
}
