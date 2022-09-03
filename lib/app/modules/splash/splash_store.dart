import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;

abstract class _SplashStoreBase with Store {
  Future<void> goPage() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );
    Modular.to.navigate('/home/');
  }
}
