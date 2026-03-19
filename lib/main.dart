import 'package:actividad1/registro.dart';
import 'package:flutter/material.dart';
import 'widgets/InputWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final TextEditingController c1 = TextEditingController();
  final TextEditingController c2 = TextEditingController();

  void mostrarAlerta(BuildContext context, String mensaje) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text("Atención"),
      content: Text(
        mensaje,
        textAlign: TextAlign.center,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("OK"),
        ),
      ],
    ),
  );
}

  void validarLogin(BuildContext context) {
  String user = c1.text.trim();
  String pass = c2.text.trim();

  if (user.isEmpty && pass.isEmpty) {
    mostrarAlerta(context, "Los campos están vacíos");
    return;
  }

  if (user.isEmpty) {
    mostrarAlerta(context, "El campo usuario está vacío");
    return;
  }

  if (pass.isEmpty) {
    mostrarAlerta(context, "El campo contraseña está vacío");
    return;
  }

  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Registro(usuario: user),
      ),
    );
}

  @override
  void dispose() {
    c1.dispose();
    c2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Iniciar sesión"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                  'https://cdn-icons-png.freepik.com/512/552/552721.png',
                ),
              ),
              SizedBox(height: 30),

              FractionallySizedBox(
                widthFactor: 0.9,
                child: InputWidget(
                  controller: c1,
                  label: "Ingrese su usuario",
                  icon: Icons.person,
                  borderRadius: 15,
                ),
              ),

              SizedBox(height: 15),

              FractionallySizedBox(
                widthFactor: 0.9,
                child: InputWidget(
                  controller: c2,
                  label: "Ingrese su Contraseña",
                  icon: Icons.password,
                  isPassword: true,
                  borderRadius: 15,
                ),
              ),

              SizedBox(height: 30),

              FractionallySizedBox(
                widthFactor: 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    validarLogin(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text("Iniciar Sesión"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}