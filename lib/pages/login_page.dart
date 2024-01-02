import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth/auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuthException? errorMessage;
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e;
      });
    }
  }

  Future<void> _loginWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final AccessToken? accessToken = result.accessToken;
        if (accessToken != null) {
          final OAuthCredential credential =
              FacebookAuthProvider.credential(accessToken.token);
          await FirebaseAuth.instance.signInWithCredential(credential);
        }
      }
    } catch (e) {
      print("Error logging in with Facebook: $e");
    }
  }

  Widget _title() {
    return const Text("Firebase Auth");
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // Color del borde
        borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
          labelText: title,
          border: InputBorder.none, // Oculta el borde del TextField
        ),
      ),
    );
  }

  Widget _errorMessage() {
    final errorMessage = this.errorMessage;
    if (errorMessage != null) {
      var mens = errorMessage.code;

      return Text("$mens");
    } else {
      return Text("");
    }
  }

  Widget _submitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLogin
            ? signInWithEmailAndPassword
            : createUserWithEmailAndPassword,
        child: Text(isLogin ? 'Login' : 'Register'),
      ),
    );
  }

  Widget _loginOrRegisterButton() {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          setState(() {
            isLogin = !isLogin;
          });
        },
        child: Text(isLogin ? 'Register instead' : 'Login instead'),
      ),
    );
  }

  Widget _credentialsContainer() {
    return Container(
      child: Column(
        children: [
          _entryField("Email", _controllerEmail),
          SizedBox(height: 20),
          _entryField("Password", _controllerPassword),
          SizedBox(height: 20),
          _errorMessage(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/login2.jpg'), // Ruta de la imagen
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 300, // Ancho del contenedor
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7), // Color del contenedor
                borderRadius: BorderRadius.circular(
                  15.0,
                ), // Bordes redondeados del contenedor
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _credentialsContainer(),
                  SizedBox(height: 20),
                  _submitButton(),
                  SizedBox(height: 10),
                  _loginOrRegisterButton(),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _loginWithFacebook,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        primary: Colors.white,
                        padding: EdgeInsets.all(20.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text('Iniciar sesión con Facebook',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Aquí puedes llamar a la función para iniciar sesión con Google
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        primary: Colors.white,
                        padding: EdgeInsets.all(20.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Iniciar sesión con Google',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
