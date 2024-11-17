import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String email;

  HomePage({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        backgroundColor: Colors.purple[200],
      ),
      backgroundColor: Colors.purple[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('lib/images/logo.png'),
              backgroundColor: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'Bienvenido, $email',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

