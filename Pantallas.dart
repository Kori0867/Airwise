// lib/pantallas/pantallas.dart
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Pantalla de Home', style: TextStyle(fontSize: 24)),
    );
  }
}

class NotificacionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Pantalla de Notificaciones', style: TextStyle(fontSize: 24)),
    );
  }
}

class MonitoreoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Pantalla de Monitoreo', style: TextStyle(fontSize: 24)),
    );
  }
}
