import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMC',
      home: MainScreen(),
      theme: ThemeData(
        primaryColor: Colors.blue[900],
        backgroundColor: Colors.grey[100],
        fontFamily: 'Open Sans',
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 22,
              fontStyle: FontStyle.italic,
              color: Colors.white,
              fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 18, color: Colors.blue[900]),
        ),
      ),
    ),
  );
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC',
            style: Theme.of(context).textTheme.headline1),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            Icon(
              Icons.people,
              size: 120,
              color: Theme.of(context).primaryColor,
            ),
            textField('Peso', null),
            textField('Altura', null),
            button('Calcular'),
          ],
        ),
      ),
    );
  }

  //
  //Entrada de dados
  //
  Widget textField(label, variable) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: variable,
        //
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: Theme.of(context).textTheme.headline2,
          hintText: 'Entre com seus dados.',
          hintStyle: TextStyle(fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  //
  //Botão
  //
  Widget button(label) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
