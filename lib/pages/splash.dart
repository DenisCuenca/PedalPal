import 'package:flutter/material.dart';
import 'package:pedalpal/pages/login_page.dart';
import 'package:pedalpal/services/auth/widget_tree.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 3500), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'rr.jpg',
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              const Text(
                '',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 38),
              ElevatedButton(
                onPressed: () {
                  // Navegar a la siguiente pantalla al presionar el botón
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => WidgetTree()),
                  );
                },
                child: const Text('Empezar Ahora'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                ),
              ),
              SizedBox(height: 100), // Espacio adicional
            ],
          ),
        ],
      ),
    );
  }
}
