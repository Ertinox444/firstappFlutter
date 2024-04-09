import 'dart:math';

import 'package:firstapp/main_page.dart';
import 'package:firstapp/next_page.dart';
import 'package:firstapp/settings.dart';
import 'package:flutter/material.dart';
/*import 'package:firstapp/my_flutter_app_icons.dart';
import 'package:json_theme/json_theme.dart';
import 'package:flutter/services.dart';
import 'dart:convert';*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Découverte de flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _reset(){
    setState(() {
      _counter = 0;
    });
  }

  void _genRandom(){
    setState(() {
      var rngRandom = Random();

      _counter = rngRandom.nextInt(101);

    });
  }


int currentPageIndex = 0;  
_getDrawerItemWidget(int pos) {
 switch (pos) {
 case 0:
 return new AcceuilBody();
 case 1:
 return new NextPageBody();
 case 2://Nom de votre StatefulWidget dans votre fichier Acceuil
return new SettingBody();

 

 default:
 return new Text("Erreur de page");
 }
 }

@override
 void initState() {
super.initState();
 }

 @override
 Widget build(BuildContext context) {
 return Column(
children: [
 AppBar(
  key: Key('appBarPrincipale'),
  title: Text('Test App'),
),
 
 Expanded(
  child: Scaffold(
      body: _getDrawerItemWidget(currentPageIndex),
  ),
 ),
 
NavigationBar(         
 onDestinationSelected: (int index) {
  setState(() {  
      currentPageIndex = index;
  });

},

selectedIndex: currentPageIndex,
 destinations: const <Widget>[
 NavigationDestination(
 icon: Icon(Icons.home),
label: "Accueil",
 ),
 NavigationDestination(
icon: Icon(Icons.next_plan),
 label:"Next Page",
 ),
 NavigationDestination(

 icon:Icon(Icons.settings),
 label:"Settings",
 )
 ,
 NavigationDestination(
 icon: Icon(Icons.music_note),
label: "Musique Description",
 ),
 ],

),
 ],
 
 );
 
        
      
  }
}
