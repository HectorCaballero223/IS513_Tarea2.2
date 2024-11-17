import 'package:flutter/material.dart';
import 'user_database.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
        backgroundColor: Colors.purple[200], // Fondo morado claro en la app bar
      ),
      backgroundColor: Colors.purple[50], // Fondo morado claro para la pantalla
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Campo de nombre
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white), // Borde blanco
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    border: InputBorder.none, // Elimina el borde por defecto
                    contentPadding: EdgeInsets.all(16),
                  ),
                  validator: (value) {
                    if (value == null || value.length < 3 || value.length > 10) {
                      return 'El nombre debe tener entre 3 y 10 caracteres';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              // Campo de correo
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white), // Borde blanco
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Correo',
                    border: InputBorder.none, // Elimina el borde por defecto
                    contentPadding: EdgeInsets.all(16),
                  ),
                  validator: (value) {
                    if (value == null || !RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value.trim())) {
                      return 'Por favor, introduce un correo válido';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              // Campo de teléfono
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white), // Borde blanco
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Teléfono',
                    border: InputBorder.none, // Elimina el borde por defecto
                    contentPadding: EdgeInsets.all(16),
                  ),
                  validator: (value) {
                    if (value == null || value.length != 8 || !(value.startsWith('3') || value.startsWith('9'))) {
                      return 'El teléfono debe tener 8 dígitos y comenzar con 3 o 9';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              // Campo de contraseña
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white), // Borde blanco
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    border: InputBorder.none, // Elimina el borde por defecto
                    contentPadding: EdgeInsets.all(16),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.length < 8 || !RegExp(r'[A-Z]').hasMatch(value) || !RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                      return 'La contraseña debe tener 8 caracteres, 1 mayúscula y 1 especial';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              // Campo de confirmar contraseña
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white), // Borde blanco
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confirmar Contraseña',
                    border: InputBorder.none, // Elimina el borde por defecto
                    contentPadding: EdgeInsets.all(16),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Las contraseñas no coinciden';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              // Botón de registro
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    UserDatabase.users[_emailController.text] = _passwordController.text;
                    print('Usuario registrado: ${_emailController.text}');
                    print('Contraseña guardada: ${_passwordController.text}');
                    Navigator.pop(context);
                  }
                },
                child: Text('Registrarse'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
