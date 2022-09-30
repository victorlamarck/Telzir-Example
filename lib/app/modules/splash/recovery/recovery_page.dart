import 'package:disconts/app/shared/core/app_fonts.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:disconts/app/modules/splash/recovery/recovery_store.dart';
import 'package:flutter/material.dart';

class RecoveryPage extends StatefulWidget {
  const RecoveryPage({Key? key}) : super(key: key);
  @override
  RecoveryPageState createState() => RecoveryPageState();
}

class RecoveryPageState extends State<RecoveryPage> {
  final controller = Modular.get<RecoveryStore>();

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
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          children: <Widget>[
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Esqueceu sua senha?',
                  style: AppFonts.openSans.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Enviaremos um código de recuperação para o seu email ex***@mail.com\nPor favor preencha o endereço:',
                    style: AppFonts.roboto.copyWith(
                      fontSize: 16,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Text(
                  'E-MAIL',
                  style: AppFonts.roboto.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextFormField(
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
            const SizedBox(height: 32),
            SizedBox(
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
                        borderRadius: BorderRadius.circular(12)))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
