import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu Aplicativo', // Substitua pelo nome do seu app
      theme: ThemeData(
        primarySwatch: Colors.blue, // Defina o tema principal
      ),
      home: SplashScreen(), // Defina a tela inicial como SplashScreen
    ),
  );
}


