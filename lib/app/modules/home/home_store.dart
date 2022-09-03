import 'package:mobx/mobx.dart';
import 'package:wakke_fun/app/modules/home/repository/i_home_repository.dart';
import 'package:wakke_fun/app/shared/utils/models/wake.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  IHomeRepository repository;

  HomeStoreBase({
    required this.repository,
  });

  @observable
  List<Wake>? wakes = [];

  @observable
  bool isLoading = true;

  @action
  Future<void> getWakes() async {
    try {
      isLoading = true;
      final wakesList = await repository.getWakes();
      wakes = wakesList;
      await Future.delayed(
        const Duration(
          seconds: 2,
        ),
      );
    } catch (e) {
      wakes = null;
    } finally {
      isLoading = false;
    }
  }
}
