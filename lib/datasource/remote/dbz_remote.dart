import 'dart:async';
import 'package:api_dragon_ball/config.dart';
import 'package:api_dragon_ball/services/cliente_http.dart';
import 'package:api_dragon_ball/models/dbz.dart';

class DbzRemote {
  final _clienteHttp = ClienteHttp();

  Future<List<Dbz>> get() async {
    final lista = await _clienteHttp.getJson(linkAPI);

    await Future.delayed(const Duration(seconds: 5));

    return lista.map((e) => Dbz(nome: e["name"], image: e["image"], ki: e['ki'], raca: e['race'])).toList();
  }
}
