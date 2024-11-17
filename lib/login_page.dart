import 'package:flutter/material.dart';
import 'user_database.dart';
import 'home_page.dart';
import 'registration_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de Sesión'),
        backgroundColor: Colors.purple[200],
      ),
      backgroundColor: Colors.purple[50],
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('lib/images/logo.png'),
              backgroundColor: Colors.white,
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Correo',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String email = _emailController.text;
                String password = _passwordController.text;

                if (UserDatabase.users.containsKey(email) &&
                    UserDatabase.users[email] == password) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(email: email),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Credenciales incorrectas'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Iniciar sesión'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationPage()),
                );
              },
              child: Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}
