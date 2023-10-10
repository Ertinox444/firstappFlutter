import 'dart:math';

import 'package:flutter/material.dart';

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

      _counter = rngRandom.nextInt(100);

    });
  }
int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: NavigationBar(
        
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
 selectedIcon: Icon(Icons.bookmark),
 icon:Icon(Icons.settings),
 label:"Settings",
 )
 ,
 
],

 ),
 
        appBar: AppBar(
          
          backgroundColor: Colors.red,
          title: Text(widget.title),
        ),
        
        body: <Widget>[
  Container(
    child: ListView(
      children: <Widget>[
        Image.asset(
          'image/mariogif2.gif',
          width: 500,
          alignment: Alignment.center,
        ),
     /*   Image.network(
          'https://media.tenor.com/YCzYhcMQsAYAAAAd/super-mario-galaxy-mario-galaxy.gif',
          width: 500,
          alignment: Alignment.center,
        ),*/
        const Text(
          'Nombre:',
        ),
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    ),
  ),
  Container(
    color: Colors.green,
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        
        ElevatedButton(
          onPressed: _genRandom,
          child: const Text('Générer un nombre'),
        ),
        Text(
          '$_counter',
          style: TextStyle(fontSize: 20),
        ),
      ],
    ),
  ),
  Container(
    color: Color.fromARGB(255, 0, 0, 255),
    alignment: Alignment.center,
    child: const Text('Paramètres'),
  )
][currentPageIndex],

 
        
        floatingActionButton: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 31),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  onPressed: _decrementCounter,
                  child: Icon(Icons.exposure_minus_1),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: _incrementCounter,
                child: Icon(Icons.plus_one),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                onPressed: _reset,
              child: Icon(Icons.restart_alt),
              ),
              
            ),
            
            
          ],
          
          
        ));
        
  }
}
