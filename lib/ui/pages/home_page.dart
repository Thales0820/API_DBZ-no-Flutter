import 'package:api_dragon_ball/datasource/remote/dbz_remote.dart';
import 'package:api_dragon_ball/ui/pages/detalhes_page.dart';
import 'package:api_dragon_ball/ui/widgets/circulo_espera.dart';
import 'package:flutter/material.dart';
import 'package:api_dragon_ball/models/dbz.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Dragon Ball Z ', style: TextStyle(color: Color(0xFFFF0000))),
              Icon(Icons.stars_rounded, color: Color(0xFFFF0000)),
            ],
          ),
          backgroundColor: Colors.orange.shade500,
        ),
        body: FutureBuilder(
          future: DbzRemote().get(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const CirculoEspera();
              default:
                return _criarLista(context, snapshot.data ?? []);
            }
          },
        ),
      ),
    );
  }

  Widget _criarLista(BuildContext context, List<Dbz> lista) {
    return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: GestureDetector(
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Image.network(
                          lista[index].image,
                          width: 150,
                          height: 150,
                          fit: BoxFit.contain,
                        ),
                        Expanded(child: Text(lista[index].nome, style: const TextStyle(fontSize: 22))),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => DetalhesPage(lista[index]))
                  );
                },
              ),
            );
        });
  }
}
