import 'package:api_dragon_ball/models/dbz.dart';
import 'package:flutter/material.dart';

class DetalhesPage extends StatelessWidget {
  final Dbz dbz;
  const DetalhesPage(this.dbz, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(dbz.nome, style: const TextStyle(color: Color(0xFFFF0000))),
            const Icon(Icons.stars_rounded, color: Color(0xFFFF0000)),
          ],
        ),
        backgroundColor: Colors.orange.shade500,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(dbz.image, height: 500),
            const SizedBox(width: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Ki: ',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
                    children: [
                      TextSpan(
                        text: dbz.ki,
                        style: TextStyle(fontWeight: FontWeight.normal, color: Colors.red.shade900, fontSize: 25),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    text: 'Raça: ',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
                    children: [
                      TextSpan(
                        text: dbz.raca,
                        style: TextStyle(fontWeight: FontWeight.normal, color: Colors.red.shade900, fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}