import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailTextFieldController = TextEditingController();

  var passwordTextFieldController = TextEditingController();

  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      color: const Color(0xff9CCCF7),
      child: Container(
        height: 370,
        width: 370,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding:
            const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
        child: Column(children: [
          const Row(
            children: [
              Icon(Icons.house),
              Text(
                'Salestem',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bem-vindo de volta!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Text(
                    'Ainda não possui uma conta?',
                    style: TextStyle(fontSize: 12),
                  ),
                  TextButton(
                      onPressed: () {
                        print('Vai para tela de cadastro');
                      },
                      child: const Text('Crie sua conta'))
                ],
              ),
              Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'E-mail',
                        hintText: 'Digite seu e-mail'),
                  ),
                  TextFormField(
                      obscureText: isObscureText, // oculta o texto digitado
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        hintText: 'Digite sua senha',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {
                            setState(() => isObscureText = !isObscureText);
                          },
                        ),
                      )),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(327, 50),
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: const Text('Entrar'),
                  )
                ],
              )
            ],
          )
        ]),
      ),
    ));
  }
}

// Color(0xff9CCCF7)