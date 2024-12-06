import 'package:flutter/material.dart';
import 'package:sistema_login_cadastro/auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool entrar = true;

  final _formkey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();

  final AuthService _authServ = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (entrar) ? Colors.black : Colors.brown[900],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: (entrar) ? Colors.red : Colors.deepOrangeAccent,
        title: Text(
          (entrar) ? "Tela de Login" : "Tela de Cadastro",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Icon(
                  (entrar)
                      ? Icons.account_circle_rounded
                      : Icons.account_circle_outlined,
                  color: Colors.white,
                  size: 110,
                ),
                const SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: !entrar,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nomeController,
                        validator: (String? value) {
                          if (value == null) {
                            return "O campo Nome precisa ser preenchido";
                          } else if (value.length < 3) {
                            return "O campo Nome precisa ter o mínimo de 3 caracteres";
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Nome",
                          fillColor: Colors.white,
                          filled: true,
                          hintStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w200,
                            fontSize: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  validator: (String? value) {
                    if (value == null) {
                      return "O campo E-mail precisa ser preenchido";
                    } else if (value.length < 5) {
                      return "O campo E-mail precisa ter o mínimo de 5 caracteres";
                    } else if (!value.contains("@")) {
                      return "O campo E-mail precisa ter o arroba ( @ )";
                    } else if (!value.contains(".")) {
                      return "O campo E-mail precisa ter o ponto ( . )";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "E-mail",
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: _senhaController,
                  validator: (String? value) {
                    if (value == null) {
                      return "O campo Senha precisa ser preenchido";
                    } else if (value.length < 8) {
                      return "O campo Senha precisa ter o mínimo de 8 caracteres";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Senha",
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                    fontSize: 16,
                  ),
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        botaoEntrar();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            (entrar) ? Colors.red : Colors.deepOrangeAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Text(
                        (entrar) ? "Entrar" : "Cadastrar",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      entrar = !entrar;
                    });
                  },
                  child: Text(
                    (entrar) ? "Cadastre-se" : "Entre",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  botaoEntrar() {
    String nome = _nomeController.text;
    String email = _emailController.text;
    String senha = _senhaController.text;

    if (_formkey.currentState!.validate()) {
      if (entrar) {
        print("Entrada validada.");
      } else {
        print("Cadastro validado");
        print("${_nomeController.text}");
        print("${_emailController.text}");
        print("${_senhaController.text}");
        _authServ.cadUser(email: email, senha: senha, nome: nome);
      }
    } else {
      print("formulario não funcionando");
    }
  }
}
