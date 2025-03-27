import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/trip_provider.dart';

class PaymentScreen extends StatelessWidget {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TripProvider()),
      ],
      child: Builder(
        builder: (context) {
          // Simulamos un viaje al cargar la pantalla
          context.read<TripProvider>().startTrip("Estación A", "Estación B");

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text('Pagar Viaje'),
            ),
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: Consumer<TripProvider>(
                builder: (context, provider, child) {
                  final trip = provider.currentTrip;
                  if (trip == null) return Center(child: Text('No hay viaje activo'));

                  return Column(
                    children: [
                      Image.asset('assets/trip_image.png'),
                      Text('Origen: ${trip.origin}'),
                      Text('Destino: ${trip.destination}'),
                      Text('Costo: \$${trip.cost}'),
                      TextField(
                        controller: cardNumberController,
                        decoration: InputDecoration(labelText: 'Número de Tarjeta'),
                      ),
                      TextField(
                        controller: expiryController,
                        decoration: InputDecoration(labelText: 'Fecha de Vencimiento'),
                      ),
                      TextField(
                        controller: cvvController,
                        decoration: InputDecoration(labelText: 'CVV'),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          provider.payTrip(
                            cardNumberController.text,
                            expiryController.text,
                            cvvController.text,
                          );
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Pago realizado')),
                          );
                        },
                        child: Text('Pagar'),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}