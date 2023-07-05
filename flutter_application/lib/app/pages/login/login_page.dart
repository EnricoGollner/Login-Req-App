import 'package:flutter/material.dart';
import 'package:flutter_application_diy/app/data/http/http_client.dart';
import 'package:flutter_application_diy/app/data/repositories/usuario_repository.dart';
import 'package:flutter_application_diy/app/pages/login/stores/usuario_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final UsuarioStore usuarioStore = UsuarioStore(
    repository: UsuarioRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();
    usuarioStore.getUsuarios();
  }

  final _formKey = GlobalKey<FormState>();
  final _emailTextFieldController = TextEditingController();
  final _passwordTextFieldController = TextEditingController();

  bool _isObscureText = true;
  Icon showVisibleIcon(bool isObscureText) {
    if (isObscureText) {
      return const Icon(Icons.visibility_off);
    }
    return const Icon(Icons.visibility);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      color: const Color(0xff9CCCF7),
      child: Container(
        height: 414,
        width: 370,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding:
            const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text('Crie sua conta'))
                ],
              ),
              _loginForm()
            ],
          )
        ]),
      ),
    ));
  }

  Form _loginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailTextFieldController,
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'E-mail',
                hintText: 'Digite seu e-mail'),
            validator: (email) {
              if (email == null || email.isEmpty) {
                return 'Digite seu e-mail';
              }

              return null;
            },
          ),
          TextFormField(
              controller: _passwordTextFieldController,
              obscureText: _isObscureText, // oculta o texto digitado
              validator: (pass) {
                if (pass == null || pass.isEmpty) {
                  return 'Digite sua senha';
                } else if (pass.length <= 5) {
                  return 'Digite uma senha mais forte';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Senha',
                hintText: 'Digite sua senha',
                suffixIcon: IconButton(
                  icon: showVisibleIcon(_isObscureText),
                  onPressed: () {
                    setState(() => _isObscureText = !_isObscureText);
                  },
                ),
              )),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(328, 50),
              backgroundColor: Colors.black,
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final email = _emailTextFieldController.text;
                final password = _passwordTextFieldController.text;

                logar(email: email, pass: password);
              }
            },
            child: const Text('Entrar'),
          )
        ],
      ),
    );
  }

  void _showNoUserFoundDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Erro'),
            content: const Text('O usuário não foi encontrado.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void logar({required String email, required String pass}) {
    final users = usuarioStore.state.value;

    try {
      users.firstWhere((user) => user.email == email && user.password == pass);
      Navigator.pushNamed(context, '/home');
    } catch (e) {
      _showNoUserFoundDialog(context);
    }
  }
}
