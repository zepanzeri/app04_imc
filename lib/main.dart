import 'dart:math';
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
  var txtWeight = TextEditingController();
  var txtHeight = TextEditingController();
  // chave que identifica unicamente o formulario
  var formKey = GlobalKey<FormState>();
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
            onPressed: () {
              setState(() {
                formKey.currentState.reset();
                txtWeight.text = "";
                txtHeight.text = "";
                FocusScope.of(context).unfocus();
              });
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.all(40),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Icon(
                Icons.people,
                size: 120,
                color: Theme.of(context).primaryColor,
              ),
              textField('Peso', txtWeight),
              textField('Altura', txtHeight),
              button('Calcular'),
            ],
          ),
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
        //
        //Validar entrada de dados
        //
        validator: (value) {
          if (double.tryParse(value) == null) {
            return 'Entre com uma valor numerico';
          } else {
            return null;
          }
        },
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
        onPressed: () {
          if (formKey.currentState.validate()) {
            //o metodo setState é utilizado todas as vezes que é necessário alterar o estado do app
            setState(() {
              double weight = double.parse(txtWeight.text);
              double height = double.parse(txtHeight.text);
              double imc = weight / pow(height, 2);
              dialogBox('IMC = ${imc.toStringAsFixed(2)}');
            });
          }
        },
      ),
    );
  }

  //
  //Caixa de dialogo
  //
  dialogBox(msg) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Resultado'),
          content: Text(msg),
          actions: [
            TextButton(
              child: Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
