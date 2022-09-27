import 'package:example/app/modules/splash/recovery/confirmation/confirmation_store.dart';
import 'package:example/app/shared/core/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({Key? key}) : super(key: key);
  @override
  ConfirmationPageState createState() => ConfirmationPageState();
}

class ConfirmationPageState extends State<ConfirmationPage> {
  final controller = Modular.get<ConfirmationStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 30,
          child: Image.asset(
            'assets/images/logo.jpg',
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 23),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Insira seu token',
                  style: AppFonts.openSans.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Para cadastrar sua nova senha, insira o token que você recebeu por e-mail:',
                    style: AppFonts.roboto.copyWith(
                      fontSize: 16,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'TOKEN',
                  style: AppFonts.roboto.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
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
              controller: controller.tokenController,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Este campo precisa ser preenchido!';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'NOVA SENHA',
                  style: AppFonts.openSans.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Observer(
              builder: (_) {
                return TextFormField(
                  obscureText: controller.newPassIsObscured,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(width: 1),
                    ),
                    suffixIcon: IconButton(
                      icon: controller.newPasswordIcon,
                      onPressed: controller.showNewPassword,
                    ),
                  ),
                  controller: controller.newPasswordController,
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'CONFIRMAR NOVA SENHA',
                  style: AppFonts.openSans.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Observer(
              builder: (_) {
                return TextFormField(
                  obscureText: controller.confirmationPassIsObscured,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(width: 1),
                    ),
                    suffixIcon: IconButton(
                      icon: controller.confirmationPasswordIcon,
                      onPressed: controller.showConfirmationPassword,
                    ),
                  ),
                  controller: controller.confirmationPasswordController,
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
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: () => Modular.to.pushNamed('/recovery/confirmation'),
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
        ],
      ),
    );
  }
}
