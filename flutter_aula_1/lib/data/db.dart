import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  // Essa classe é criada pois como o sqlite é um bd do tipo sql, nos precisamos
  // fazer a abertura deste banco entre outras funcionalidades.
  // o sqlite usa o singleton 

  //Construtor com acesso privado 
  DB._();

  //Criar uma instancia de DB
  static final DB instance = DB._();

  // Instancia do SQLite
  static Database? _database;

  
  _initDataBase() async{
    //abertura do dataBase
    return await openDatabase(
      //unir o caminho do dataBase do sistema
      join(await getDatabasesPath(), 'cripto.db'),
      version: 1,
      onCreate: _onCreate,
    )
  }

  get database async{
    if (_database != null) {
      return _database;
    }
    return await _initDataBase();
  }

}