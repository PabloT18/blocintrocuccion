part of 'stores_bloc.dart';

@immutable
abstract class StoresEvent {}

class LoadStores extends StoresEvent {
  LoadStores() {
    print('aaaa');
  }
}

class LoadNewSotore extends StoresEvent {
  LoadStores() {
    print('aaaa');
  }
}
