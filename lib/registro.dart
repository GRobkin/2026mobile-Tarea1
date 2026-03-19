import 'package:flutter/material.dart';
import 'widgets/InputWidget.dart';

class Registro extends StatefulWidget {
  final String usuario;
  const Registro({super.key, required this.usuario});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final TextEditingController c1 = TextEditingController();
  final TextEditingController c2 = TextEditingController();
  final TextEditingController c3 = TextEditingController();
  final TextEditingController c4 = TextEditingController();
  final TextEditingController c5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Text("Bienvenido ${widget.usuario}", style: TextStyle(
                fontSize: 32,
                color: Colors.black
              ),
              ),
              SizedBox(height: 30),
              FractionallySizedBox(
                widthFactor: 0.9,
                child: InputWidget(
                  controller: c1,
                  label: "Nombre",
                  borderRadius: 35,
                ),
              ),
              SizedBox(height: 15),
              FractionallySizedBox(
                widthFactor: 0.9,
                child: InputWidget(
                  controller: c2,
                  label: "Edad",
                  borderRadius: 35,
                ),
              ),
              SizedBox(height: 15),
              FractionallySizedBox(
                widthFactor: 0.9,
                child: InputWidget(
                  controller: c3,
                  label: "Curso",
                  borderRadius: 35,
                ),
              ),
              SizedBox(height: 15),
              FractionallySizedBox(
                widthFactor: 0.9,
                child: InputWidget(
                  controller: c4,
                  label: "Ciudad",
                  borderRadius: 35,
                ),
              ),
              SizedBox(height: 15),
              FractionallySizedBox(
                widthFactor: 0.9,
                child: InputWidget(
                  controller: c5,
                  label: "País",
                  borderRadius: 35,
                ),
              ),
              SizedBox(height: 30),
              FractionallySizedBox(
                widthFactor: 0.9,
                child: ElevatedButton(onPressed: (){
                  
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  "Guardar Datos"
                ),
                ),
              ),
              SizedBox(height: 30),
              FractionallySizedBox(
                widthFactor: 0.9,
                child: ElevatedButton(onPressed: (){
                  
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  "Volver al Login"
                ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}