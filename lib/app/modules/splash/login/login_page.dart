import 'package:disconts/app/modules/splash/login/login_store.dart';
import 'package:disconts/app/shared/core/app_colors.dart';
import 'package:disconts/app/shared/core/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final controller = Modular.get<LoginStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.keyForm,
          child: ListView(
            children: <Widget>[
              Stack(
                children: [
                  Image.asset(
                    'assets/images/logo.jpg',
                    height: 250,
                    width: double.infinity,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.arrow_back_rounded),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Login',
                      style: AppFonts.openSans.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'E-MAIL',
                      style: AppFonts.openSans.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(width: 1),
                    ),
                  ),
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Este campo precisa ser preenchido!';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'SENHA',
                      style: AppFonts.openSans.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Observer(
                  builder: (_) {
                    return TextFormField(
                      obscureText: controller.isObscured,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(width: 1),
                        ),
                        suffixIcon: IconButton(
                          icon: controller.passwordIcon,
                          onPressed: controller.showPassword,
                        ),
                      ),
                      controller: controller.passwordController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Este campo precisa ser preenchido!';
                        }
                        return null;
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    TextButton(
                      child: Text(
                        'ESQUECI MINHA SENHA',
                        style: AppFonts.roboto.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.green,
                        ),
                      ),
                      onPressed: () => Modular.to.pushNamed('/recovery/'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 54),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: controller.validate,
                    child: Text(
                      'Enviar',
                      style: AppFonts.roboto.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'AINDA NÃO TEM CADASTRO?',
                    style: AppFonts.roboto.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    child: Text(
                      'CLIQUE AQUI!',
                      style: AppFonts.roboto.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: AppColors.green,
                      ),
                    ),
                    onPressed: () => Modular.to.pushNamed('/register/'),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
