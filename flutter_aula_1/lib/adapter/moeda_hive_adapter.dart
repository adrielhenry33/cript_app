import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_aula_1/models/moeda.dart';

class MoedaHiveAdapter extends TypeAdapter <Moeda>{
  @override
  final typeId = 0;

  @override
  //BinaryReader são métodos do proprio adapter
  Moeda read(BinaryReader reader){
    return Moeda(
      icone: reader.readString(),
      nome: reader.readString(),
      sigla: reader.readString(),
      preco: reader.readDouble(),
    );
  }
  @override
  void  write(BinaryWriter writer, Moeda moeda){
    writer.writeString(moeda.icone);
    writer.writeString(moeda.nome);
    writer.writeString(moeda.sigla);
    writer.writeDouble(moeda.preco);
  }
}