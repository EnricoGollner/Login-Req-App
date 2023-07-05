import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.title});

  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _passConfController = TextEditingController();

  bool _isObscure = true;

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
        color: const Color(0xff9CCCF7),
        alignment: Alignment.center,
        child: Container(
          height: 460,
          width: 370,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Row(
                children: [
                  Icon(Icons.house),
                  SizedBox(width: 2),
                  Text(
                    'Salestem',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Já possui cadastro?'),
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Faça Log-in'))
                ],
              ),
              _registerForm(),
              Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(top: 24),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size(328, 50),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Cadastrar'),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  String? textFormValidation(String? textFormContent) {
    if (textFormContent == null || textFormContent.isEmpty) {
      return 'Este campo não pode ficar vazio';
    }
    return null;
  }

  Form _registerForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('E-mail'),
              hintText: 'Digite seu e-mail',
              prefixIcon: Icon(Icons.email),
            ),
            validator: textFormValidation,
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: _passController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Senha'),
              hintText: 'Digite sua senha',
              prefixIcon: Icon(Icons.lock),
            ),
            validator: textFormValidation,
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: _passConfController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: const Text('Digite sua senha'),
              hintText: 'Confirme sua senha',
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                icon: showVisibleIcon(_isObscure),
              ),
            ),
            obscureText: _isObscure,
            validator: textFormValidation,
          )
        ],
      ),
    );
  }
}
