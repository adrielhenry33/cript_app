import 'package:flutter/material.dart';
import 'package:flutter_aula_1/configs/app_settings.dart';
import 'package:flutter_aula_1/pages/moedas_detalhes_page.dart';
import 'package:flutter_aula_1/repositories/favoritas_repository.dart';
import 'package:flutter_aula_1/repositories/moeda_respository.dart';
import 'package:intl/intl.dart';
import 'package:flutter_aula_1/models/moeda.dart';
import 'package:flutter_aula_1/models/float_button_custom.dart';
import 'package:provider/provider.dart';

class MoedasPage extends StatefulWidget {
  const MoedasPage({super.key});

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> with TickerProviderStateMixin {
  final tabela = MoedaRespository.tabela;
  List<Moeda> selecionadas = [];
  late NumberFormat real;
  late Map<String, String> localizacao;
  late FavoritasRepository favoritas;

  void readNumberFormat() {
    localizacao = context.watch<AppSettings>().locale;//lendo o Provider
    real = NumberFormat.currency(
      locale: localizacao['locale'],
      name: localizacao['name'],
    );
  }

  void changeLanguageButton() {
    final locale = localizacao['locale'] == 'pt_BR' ? 'en_US' : 'pt_BR';
    final name = localizacao['name'] == 'R\$' ? '\$' : 'R\$';
  }

  bool showFAB = true;

  PreferredSizeWidget appBarDinamica() {
    if (selecionadas.isEmpty) {
      return AppBar(
        title: Text('Cripto Moedas', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      );
    } else {
      return AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              selecionadas = [];
            });
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          '${selecionadas.length} selicionadas',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red.shade400,
        centerTitle: true,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black87),
      );
    }
  }

  late final _controller = AnimationController(
    duration: const Duration(milliseconds: 2300),
    vsync: this, //é usada principalmente em animações no Flutter e significa
    //que essa classe (this) será responsável por informar ao Flutter
    //quando redesenhar os frames da animação, sincronizando a animação
    //com o "Vertical Sync" (vsync) da tela — ou seja, ela só redesenha
    //quando necessário, economizando recursos.
  )..forward();

  late final _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut, //efeito de crescer progressivamente
    //na tela a partir do centro
  );

  void limparSelecionadas() {
    setState(() {
      selecionadas = [];
    });
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
    _animation.dispose();
  }

  void mostrarDetalhes(Moeda moeda) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return MoedasDetalhesPage(moeda: moeda);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //favoritas = Provider.of<FavoritasRepository>(context);
    //Segundo metodo de acessar o provider
    //context.watch() -> espera mudanças
    //context.reda()  ->somente ler as mudanças
    favoritas = context.watch<FavoritasRepository>();

    return Scaffold(
      appBar: appBarDinamica(),

      body: ListView.separated(
        itemCount: tabela.length,
        padding: EdgeInsets.all(16),
        separatorBuilder: (_, _) => Divider(),

        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            tileColor: Colors.white,
            selectedColor: Colors.lightBlue[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),

            leading:
                (selecionadas.contains(tabela[index]))
                    ? CircleAvatar(child: Icon(Icons.check))
                    : SizedBox(
                      width: 40,
                      child: Image.asset(tabela[index].icone),
                    ),

            title: Row(
              children: [
                Text(
                  tabela[index].nome,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                if (favoritas.lista.contains(tabela[index]))
                  Icon(Icons.circle, color: Colors.amber, size: 8),
              ],
            ),
            trailing: Text(real.format(tabela[index].preco)),
            selected: selecionadas.contains(tabela[index]),
            selectedTileColor: Colors.indigo[50],
            onLongPress: () {
              setState(() {
                if (selecionadas.contains(tabela[index])) {
                  selecionadas.remove(tabela[index]);
                } else {
                  selecionadas.add(tabela[index]);
                }
              });
            },
            onTap: () {
              return mostrarDetalhes(tabela[index]);
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ScaleTransition(
        scale: _animation,
        child:
            selecionadas.isNotEmpty
                ? FloatButtonCustom(
                  onPressed: () {
                    favoritas.saveAll(selecionadas);
                    limparSelecionadas();
                  },
                )
                : null,
      ),
    );
  }
}
