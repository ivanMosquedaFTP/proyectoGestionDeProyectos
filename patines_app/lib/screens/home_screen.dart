import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/scooter_provider.dart';
import 'report_screen.dart';
import 'payment_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScooterProvider()),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text('Mapa de la Universidad')),
        body: Column(
          children: [
            Image.asset('assets/university_map.png'),
            Consumer<ScooterProvider>(
              builder: (context, provider, child) {
                return Text('Patines disponibles: ${provider.availableScooters}');
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ReportScreen()),
                    );
                  },
                  child: Text('Reportar Patín'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => PaymentScreen()),
                    );
                  },
                  child: Text('Pagar Viaje'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}