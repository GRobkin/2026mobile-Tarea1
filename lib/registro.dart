import 'package:actividad1/main.dart';
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


  void mostrarAlerta(String titulo, String mensaje) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(titulo),
      content: Text(
        mensaje,
        textAlign: TextAlign.left,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("OK"),
        ),
      ],
    ),
  );
}


void guardarDatos() {
  String nombre = c1.text.trim();
  String edad = c2.text.trim();
  String curso = c3.text.trim();
  String ciudad = c4.text.trim();
  String pais = c5.text.trim();

  if (nombre.isEmpty ||
      edad.isEmpty ||
      curso.isEmpty ||
      ciudad.isEmpty ||
      pais.isEmpty) {
    mostrarAlerta(
      "Error",
      "Todos los campos deben estar completos",
    );
    return;
  }

  mostrarAlerta(
    "Datos registrados",
    "Nombre: $nombre\n"
    "Edad: $edad\n"
    "Curso: $curso\n"
    "Ciudad: $ciudad\n"
    "País: $pais",
  );
}
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
                  guardarDatos();
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
                  Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainApp()),
                  (route) => false,
                );
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