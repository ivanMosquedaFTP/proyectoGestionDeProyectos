import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/scooter_provider.dart';

class ReportScreen extends StatelessWidget {
  final TextEditingController idController = TextEditingController();
  final TextEditingController observationsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: 8.0),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Text('Reportar Patín'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/patin.png', // Asegúrate de tener esta imagen en tu proyecto
                    height: 300,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Reportar Patín',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: idController,
              decoration: InputDecoration(
                labelText: 'ID del Patín (4 dígitos)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              maxLength: 4,
            ),
            SizedBox(height: 20),
            TextField(
              controller: observationsController,
              decoration: InputDecoration(
                labelText: 'Descripción del problema',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<ScooterProvider>().reportScooter(
                    idController.text,
                    observationsController.text,
                  );
                  Navigator.pop(context);
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Reporte enviado')));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Enviar Reporte',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
