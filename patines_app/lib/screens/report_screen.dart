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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Reportar Patín'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(labelText: 'ID del Patín'),
            ),
            TextField(
              controller: observationsController,
              decoration: InputDecoration(labelText: 'Observaciones'),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<ScooterProvider>().reportScooter(
                      idController.text,
                      observationsController.text,
                    );
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Reporte enviado')),
                );
              },
              child: Text('Reportar'),
            ),
          ],
        ),
      ),
    );
  }
}