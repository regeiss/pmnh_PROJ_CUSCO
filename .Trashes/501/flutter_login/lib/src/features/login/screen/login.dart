import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../usuario/provider/usuario_controller.dart';

class LoginScreen extends StatefulHookConsumerWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _isHidden = true;

  @override
  void initState() {
    email.text = "";
    password.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        leading: const IconButton(onPressed: null, icon: Icon(Icons.menu)),
        title: const Text("Login - protótipo"),
      ),
      body: //Container(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage('assets/images/logo.jpg'), fit: BoxFit.cover),
       // ),
        // BackdropFilter(filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0))),
       // padding: const EdgeInsets.all(15),
       // const SizedBox(height: 20),
          Card.filled(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    autofocus: true,
                  
                    controller: email,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      icon: Icon(Icons.people),
                    ),
                  ),
                  TextField(
                    controller: password,
                    obscureText: _isHidden,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.lock),
                      labelText: "Senha",
                      suffixIcon: IconButton(
                        onPressed: _togglePasswordView,
                        icon: Icon(
                          _isHidden ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: FilledButton(
                          onPressed: () {
                            ref
                                .read(usuarioControllerProvider.notifier)
                                .login(
                                  email: email.text,
                                  password: password.text,
                                )
                                .then(
                                  (res) => {
                                    res.fold(
                                      (l) => {
                                        showSnackbar(context, l),
                                      },
                                      (r) => {
                                        Navigator.pushReplacementNamed(
                                            context, 'Home'),
                                      },
                                    ),
                                  },
                                );
                          },
                          child: const Text("Login"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void showSnackbar(BuildContext context, String text) {             
    final snackBar = SnackBar(
        elevation: 6.0,
        backgroundColor: Color.fromARGB(255, 7, 23, 112),
        behavior: SnackBarBehavior.floating,
        content: Text(text),
        duration: const Duration(seconds: 5));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
