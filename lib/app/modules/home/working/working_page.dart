import 'package:example/app/shared/core/app_fonts.dart';
import 'package:flutter/material.dart';

class WorkingPage extends StatelessWidget {
  const WorkingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Telzir'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueGrey.shade100,
              ),
              padding: EdgeInsets.all(32),
              child: Icon(
                Icons.engineering_rounded,
                color: Colors.blueGrey.shade400,
                size: 62,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Em Construção!',
              style: AppFonts.title,
            ),
            const SizedBox(height: 8),
            Text(
              'Em breve você poderá assinar o plano escolhido aqui.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
