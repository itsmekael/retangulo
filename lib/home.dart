import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

  class _HomeState extends State<Home> {
  TextEditingController _controllerBase = TextEditingController();
  TextEditingController _controllerAltura = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double? base = double.tryParse(_controllerBase.text); 
    double? altura = double.tryParse(_controllerAltura.text);
    double? area;
    
      if (base == null || altura == null) {
      setState(() {
        _textoResultado =
          "Número inválido, digite números maiores que 0";
      });
    }else{
      area = base * altura;
      print(area);
        setState(() {
          _textoResultado = area.toString();
          _controllerAltura.clear();
          _controllerBase.clear();
        });
      }
    }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Área do Retângulo!"),
        backgroundColor: Color.fromARGB(255, 255, 0, 128),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom:32),
                  child: Image(
                    image: AssetImage("imagens/AreaRetangulo.png"),
                    width: 300,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Text(
                    "Saiba a Área do Retângulo!",
                    textAlign: TextAlign.center,
                    style:TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      decoration: TextDecoration.underline) ,
                  )
              )),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Valor da Base."),
                style: TextStyle(fontSize: 25),
                controller: _controllerBase,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Valor da Altura."),
                style: TextStyle(fontSize: 25),
                controller: _controllerAltura,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    backgroundColor: Color.fromARGB(255, 255, 0, 128),
                    textStyle: TextStyle(fontSize: 25)),
                    onPressed: _calcular,
                    child: Text(
                      "Calcular",
                      style: TextStyle(color: Colors.white),
                    ),
                ),
              ),
             Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    _textoResultado,
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
              ),
            ]
          ),
          ),
        ),
    );
  }
  }