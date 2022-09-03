import 'package:flutter_modular/flutter_modular.dart';
import 'package:wakke_fun/app/modules/home/repository/home_repository.dart';
import 'package:wakke_fun/app/modules/home/repository/i_home_repository.dart';
import '../home/home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<IHomeRepository>(
      (i) => HomeRepository(),
    ),
    Bind.lazySingleton(
      (i) => HomeStore(
        repository: i<IHomeRepository>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const HomePage(),
    ),
  ];
}
