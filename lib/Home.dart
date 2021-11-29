import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerCampo = TextEditingController();

  String _textoSalvo = "Nada salvo!";

//_controllerCampo input save .
  _salvar() async {
    String valorDigitado = _controllerCampo.text;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("Nome", valorDigitado);

    print(valorDigitado);
  }

//_controllerCampo input recover.
  _recuperar() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _textoSalvo = prefs.getString("Nome") ?? "Sem valor";
    });
  }

//_controllerCampo input delete.
  _remover() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("Nome");
    setState(() {
      _textoSalvo = "Deletado";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Text(
              _textoSalvo,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Digite algo"),
              controller: _controllerCampo,
            ),
            Row(children: <Widget>[
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.all(15),
                child: Text(
                  "Salvar",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: _salvar,
              ),
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.all(15),
                child: Text(
                  "Recuperar",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: _recuperar,
              ),
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.all(15),
                child: Text(
                  "Remover",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: _remover,
              ),
            ])
          ],
        ),
      ),
    );
  }
}
