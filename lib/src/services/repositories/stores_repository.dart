import 'dart:async';

import 'package:delivery_app/src/models/store_model.dart';

abstract class StoresRepository {
  Future<void> addNewStore(Store store);

  Future<List<Store>> getStores();
}
