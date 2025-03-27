import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/scooter_provider.dart';
import 'report_screen.dart';
import 'payment_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> scooterStations = [
    {
      'name': 'Estación A',
      'scooters': 5,
      'available': true,
      'codes': ['A123', 'A124', 'A125', 'A126', 'A127']
    },
    {
      'name': 'Estación B',
      'scooters': 0,
      'available': false,
      'codes': []
    },
    {
      'name': 'Estación C',
      'scooters': 3,
      'available': true,
      'codes': ['C789', 'C790', 'C791']
    },
    {
      'name': 'Estación D',
      'scooters': 1,
      'available': true,
      'codes': ['D012']
    },
  ];

  void _showStationDetails(BuildContext context, Map<String, dynamic> station) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(station['name']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Patines disponibles: ${station['scooters']}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            station['scooters'] > 0
                ? Column(
                    children: List.generate(station['scooters'], (index) {
                      return Row(
                        children: [
                          Icon(Icons.electric_scooter, size: 30, color: Colors.blue),
                          SizedBox(width: 10),
                          Text(
                            'Código: ${station['codes'][index]}',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      );
                    }),
                  )
                : Text(
                    'No hay patines disponibles.',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
            SizedBox(height: 10),
            Icon(
              station['available'] ? Icons.check_circle : Icons.cancel,
              color: station['available'] ? Colors.green : Colors.redAccent,
              size: 40,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text('Cerrar'),
          ),
        ],
      ),
    );
  }

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
            Image.asset('assets/images/campus-2.png'),
            Consumer<ScooterProvider>(
              builder: (context, provider, child) {
                return Text(
                  'Patines disponibles: ${provider.availableScooters}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                );
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: scooterStations.length,
                itemBuilder: (context, index) {
                  final station = scooterStations[index];
                  return ListTile(
                    leading: Icon(
                      Icons.location_on,
                      color: station['available'] ? Colors.green : Colors.redAccent,
                    ),
                    title: Text(station['name']),
                    subtitle: Text('Patines disponibles: ${station['scooters']}'),
                    trailing: Icon(Icons.info, color: Colors.blue),
                    onTap: () => _showStationDetails(context, station),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ReportScreen()),
                      );
                    },
                    icon: Icon(Icons.report_problem, color: Colors.white),
                    label: Text('Reportar Patín'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => PaymentScreen()),
                      );
                    },
                    icon: Icon(Icons.payment, color: Colors.white),
                    label: Text('Pagar Viaje'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}