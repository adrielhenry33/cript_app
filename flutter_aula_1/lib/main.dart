import 'package:flutter/material.dart';
import 'package:flutter_aula_1/configs/app_settings.dart';
import 'package:flutter_aula_1/repositories/favoritas_repository.dart';
import 'package:provider/provider.dart';
import 'meu_aplicativo.dart';
import 'package:flutter_aula_1/configs/hive_configs.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();
  runApp(

    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppSettings()),
        ChangeNotifierProvider(create: (context) => FavoritasRepository()),
      ],
      child: MeuAplicativo(),
    ),
  );
}
