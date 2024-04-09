import 'package:flutter/material.dart';


class AcceuilBody extends StatefulWidget {
 const AcceuilBody({Key? key}) : super(key: key);

 @override
 State<AcceuilBody> createState() => _AcceuilBody();
}

class _AcceuilBody extends State<AcceuilBody> {
 

 @override
 Widget build(BuildContext context) {
 return Container(
 color: Colors.blue,
alignment: Alignment.center,
child: const Text('Accueil'),
 );
 
}
}
