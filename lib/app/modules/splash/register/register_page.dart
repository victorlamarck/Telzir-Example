import 'package:disconts/app/modules/splash/register/register_store.dart';
import 'package:disconts/app/shared/core/app_colors.dart';
import 'package:disconts/app/shared/core/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final controller = Modular.get<RegisterStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (controller.indexPage == 2) {
          return RegistrySecondPage();
        }

        if (controller.indexPage == 3) {
          return RegistryThirdPage();
        }

        return RegistryFirstPage();
      },
    );
  }
}

class RegistryFirstPage extends StatelessWidget {
  final controller = Modular.get<RegisterStore>();
  RegistryFirstPage({super.key});

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
      body: Column(
        children: <Widget>[
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              child: Observer(
                builder: (_) {
                  return LinearProgressIndicator(
                    minHeight: 5,
                    color: AppColors.green,
                    value: (controller.indexPage / 3),
                    backgroundColor: Colors.grey.shade300,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 18),
          Expanded(
            child: ListView(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Cadastro',
                        style: AppFonts.openSans.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Seus dados',
                        style: AppFonts.openSans.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Preencha as informações abaixo:',
                        style: AppFonts.openSans.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'NOME',
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
                    controller: controller.nameController,
                    keyboardType: TextInputType.name,
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
                        'CPF/CNPJ',
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
                    controller: controller.cpfController,
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
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.firstStepRegister,
                child: Text(
                  'Próximo',
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
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class RegistrySecondPage extends StatelessWidget {
  final controller = Modular.get<RegisterStore>();
  RegistrySecondPage({super.key});

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
      body: Column(
        children: <Widget>[
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              child: Observer(
                builder: (_) {
                  return LinearProgressIndicator(
                    minHeight: 5,
                    color: AppColors.green,
                    value: (controller.indexPage / 3),
                    backgroundColor: Colors.grey.shade300,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 18),
          Expanded(
            child: ListView(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Cadastro',
                        style: AppFonts.openSans.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Validar e-mail',
                        style: AppFonts.openSans.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Para validar seu e-mail como um e-mail seguro, Insira o código que enviamos por seu e-mail.',
                            style: AppFonts.openSans.copyWith(
                              fontSize: 16,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'CÓDIGO',
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
                    controller: controller.tokenFromEmailController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Este campo precisa ser preenchido!';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      TextButton(
                        child: Text(
                          'NÃO RECEBI O CÓDIGO',
                          style: AppFonts.roboto.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: AppColors.green,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                    onPressed: controller.previousPage,
                    child: Text(
                      'Voltar',
                      style: AppFonts.roboto.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      fixedSize: Size(double.maxFinite, 48),
                      side: BorderSide(
                        width: 1,
                        color: Colors.black,
                        style: BorderStyle.solid,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: controller.nextPage,
                    child: Text(
                      'Próximo',
                      style: AppFonts.roboto.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(double.maxFinite, 48),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class RegistryThirdPage extends StatelessWidget {
  final controller = Modular.get<RegisterStore>();
  RegistryThirdPage({super.key});

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
      body: Column(
        children: <Widget>[
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              child: Observer(
                builder: (_) {
                  return LinearProgressIndicator(
                    minHeight: 5,
                    color: AppColors.green,
                    value: (controller.indexPage / 3),
                    backgroundColor: Colors.grey.shade300,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 18),
          Expanded(
            child: ListView(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Cadastro',
                        style: AppFonts.openSans.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Criar senha de acesso',
                        style: AppFonts.openSans.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Crie e confirme uma senha para que você possa acessar o app',
                            style: AppFonts.openSans.copyWith(
                              fontSize: 16,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'NOVA SENHA',
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
                        obscureText: controller.isObscuredNew,
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'CONFIRMAR NOVA SENHA',
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
                        obscureText: controller.isObscuredConfirmation,
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
                        controller: controller.passwordConfirmationController,
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
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 50,
              child: Row(
                children: [
                  Observer(
                    builder: (_) {
                      return Checkbox(
                        checkColor: AppColors.green,
                        activeColor: Colors.grey[300],
                        value: controller.checkBox,
                        onChanged: (value) {
                          controller.checkBox = value;
                        },
                      );
                    },
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Declaro que concordo e aceito os Termos de uso e Políticas de privacidade.',
                      style: AppFonts.openSans.copyWith(
                        fontSize: 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.registerAccount,
                child: Text(
                  'Cadastrar',
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
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 50,
                  child: Icon(
                    Icons.check_circle_rounded,
                    size: 125,
                    color: Colors.green,
                  ),
                ),
                Lottie.asset(
                  'assets/lotties/congrats.json',
                  height: 180,
                  width: 250,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                'Cadastro realizado\ncom sucesso!',
                textAlign: TextAlign.center,
                style: AppFonts.openSans.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
