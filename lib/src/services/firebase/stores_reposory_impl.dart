import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/src/models/store_model.dart';
import 'package:delivery_app/src/services/repositories/stores_repository.dart';

class FirebaseStoresRepository implements StoresRepository {
  CollectionReference storesCollection =
      FirebaseFirestore.instance.collection('negocio');

  @override
  Future<void> addNewStore(Store store) {
    throw UnimplementedError();
  }

  @override
  Future<List<Store>> getStores() async {
    final stores = <Store>[];

    try {
      QuerySnapshot snapshot = await storesCollection.get();
      snapshot.docs.map((QueryDocumentSnapshot e) {
        if (e.exists) {
          Map<String, dynamic> vare = e.data() as Map<String, dynamic>;
          final store = Store.fromJson(vare);
          stores.add(store);
        }
      }).toList();

      return stores;
    } on FirebaseException catch (e) {
      print('Firebase $e');
      print('-------------EF');
      return [];
    } catch (e) {
      print('exeption  $e');
      print('-------------E');
      return [];
    }
  }

  // Stream<List<Store>> getStores2() {
  //   final stores = <Store>[];
  //   final stores2 = <Store>[];

  //   Store store = Store();
  //   store.address = 'asdf';
  //   store.imageurl = 'asdf';
  //   store.name = 'asdf';
  //   store.score = 4.8;

  //   stores.add(store);

  //   final storesCollection2 = FirebaseFirestore.instance.collection('negocio');

  //   final querysnapshot = storesCollection2.get();

  //   // querysnapshot.docs.map((doc) => print(doc));

  //   // return stores;
  // }
}
