import 'package:wakke_fun/app/shared/utils/models/wake.dart';

abstract class IHomeRepository {
  Future<List<Wake>?> getWakes();
}
