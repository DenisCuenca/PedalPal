import 'package:flutter/material.dart';
import 'package:pedalpal/services/auth/auth.dart';

class UserPage extends StatelessWidget {
  // final Future<void> Function() signOutFunction;
  const UserPage({super.key});

  Future<void> signOut() async {
    await Auth().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        ClipRect(
          child: Align(
            alignment: Alignment.topCenter,
            heightFactor: 0.5,
            child: Image.network(
              'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/0f/b1/79/el-cisne-church.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage(
                        'sana.jpg',
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Nombre de Usuario',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Cédula: 123456789',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'correo@ejemplo.com',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.0),
                    Divider(
                      height: 20.0,
                      color: Colors.black,
                    ),
                    ListTile(
                      leading: Icon(Icons.phone, color: Colors.black),
                      title: Text('Teléfono: 123-456-789',
                          style: TextStyle(color: Colors.black)),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on, color: Colors.black),
                      title: Text('Ubicación: Ciudad, País',
                          style: TextStyle(color: Colors.black)),
                    ),
                    SizedBox(height: 70),
                    ElevatedButton.icon(
                      icon:
                          Icon(Icons.exit_to_app_rounded, color: Colors.white),
                      onPressed: () {
                        signOut();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      label: Text(
                        'Cerrar Sesión',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
