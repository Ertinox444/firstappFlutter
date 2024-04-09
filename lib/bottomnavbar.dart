import 'package:flutter/material.dart';


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
 label:"Settings"
 )
 ,
 
],

 )
    );

  }
}