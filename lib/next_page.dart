import 'dart:math';
import 'package:flutter/material.dart';

class NextPageBody extends StatefulWidget {
  const NextPageBody({Key? key}) : super(key: key);

  @override
  State<NextPageBody> createState() => _NextPageBodyState();
}

class _NextPageBodyState extends State<NextPageBody> {
  TextEditingController _controller = TextEditingController();
int _selectedIndex = 1;
  List<int> listDeValeur = List.generate(20, (index) => index + 1);
  int _randomNumber1 = 0;
  int _randomNumber2 = 0;

  @override
  void initState() {
    super.initState();
    _generateRandomNumbers();
  }

  void _generateRandomNumbers() {
    _randomNumber1 = Random().nextInt(100);
    _randomNumber2 = Random().nextInt(100);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _checkSolution(BuildContext context, String solution) {
    int solutionCorrecte = _randomNumber1 + _randomNumber2;
    int? solutionSaisie = int.tryParse(solution);
    if (solutionSaisie != null && solutionSaisie == solutionCorrecte) {
      _showToast(context, "Félicitations ! La solution est correcte !");
    } else {
      _showToast(context, "Désolé, la solution est incorrecte. Veuillez réessayer.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<int>(
            value: _selectedIndex,
            onChanged: (newValue) {
              setState(() {
                _selectedIndex = newValue!;
                _generateRandomNumbers();
              });
            },
            icon: Icon(Icons.arrow_drop_down), // Icône personnalisée
            underline: Container(
              height: 2,
              color: Colors.blue,
            ),
            style: TextStyle(color: Colors.blue, fontSize: 16), // Style du texte sélectionné
            items: listDeValeur.map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(
                  value.toString(),
                  style: TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 20), // Espace entre le DropdownButton et le TextField
          // Affichage de l'addition aléatoire
          Text(
            'Addition aléatoire : $_randomNumber1 + $_randomNumber2',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20), // Espace entre le texte et le champ de saisie
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            maxLength: 25,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              labelText: 'Entrer la solution',
              hintText: 'Entrer un nombre',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              // Pas besoin d'effectuer une action lors de la saisie, mais peut être utilisé pour valider la solution en temps réel si nécessaire
            },
          ),
          SizedBox(height: 20), // Espace entre le champ de saisie et le bouton
          ElevatedButton(
            onPressed: () {
              String solution = _controller.text;
              _checkSolution(context, solution);
            },
            child: Text('Valider'),
          ),
        ],
      ),
    );
  }
}
