import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wakke_fun/app/modules/home/home_store.dart';
import 'package:wakke_fun/app/modules/home/widgets/card_wake.dart';
import 'package:wakke_fun/app/modules/home/widgets/floaction_wake.dart';
import 'package:wakke_fun/app/modules/home/widgets/is_happening.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _store = Modular.get<HomeStore>();

  Future<void> getWakes() async {
    await _store.getWakes();
  }

  @override
  void initState() {
    getWakes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.black.withAlpha(50)),
          ),
          onPressed: () {},
          child: Image.asset(
            'assets/images/icon_header_menu.png',
          ),
        ),
        title: Image.asset(
          'assets/images/logo_wakke_roxo.png',
          scale: 4,
        ),
        actions: [
          TextButton(
            style: ButtonStyle(
              overlayColor:
                  MaterialStateProperty.all(Colors.black.withAlpha(50)),
            ),
            onPressed: () {},
            child: Image.asset(
              'assets/images/icon_header_search.png',
            ),
          ),
        ],
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloactionWake(
        onTap: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all(Colors.black.withAlpha(50)),
                ),
                onPressed: () {},
                child: Image.asset(
                  'assets/images/icon_header_menu.png',
                  height: 30,
                  width: 30,
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all(Colors.black.withAlpha(50)),
                ),
                onPressed: () {},
                child: Image.asset(
                  'assets/images/icon_add.png',
                  height: 30,
                  width: 30,
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              TextButton(
                style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all(Colors.black.withAlpha(50)),
                ),
                onPressed: () {},
                child: Image.asset(
                  'assets/images/icon_account.png',
                  height: 30,
                  width: 30,
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all(Colors.black.withAlpha(50)),
                ),
                onPressed: () {},
                child: Image.asset(
                  'assets/images/icon_notificacoes.png',
                  height: 30,
                  width: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _store.getWakes,
        child: ListView(
          padding: const EdgeInsets.all(
            10,
          ),
          children: [
            const IsHappening(),
            Observer(
              builder: (_) {
                if (_store.isLoading) {
                  return const Padding(
                    padding: EdgeInsets.only(
                      top: 50,
                    ),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (!_store.isLoading && _store.wakes == null) {
                  return const Padding(
                    padding: EdgeInsets.only(
                      top: 50,
                    ),
                    child: Center(
                      child: Text(
                        'Erro ao buscar dados!',
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _store.wakes!.length,
                  itemBuilder: (context, index) {
                    final wake = _store.wakes![index];
                    return CardWake(
                      wake: wake,
                    );
                  },
                );
              },
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
