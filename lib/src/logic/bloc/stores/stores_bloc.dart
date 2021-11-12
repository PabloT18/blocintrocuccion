import 'package:bloc/bloc.dart';
import 'package:delivery_app/src/models/store_model.dart';
import 'package:meta/meta.dart';

import 'package:delivery_app/src/services/repositories/stores_repository.dart';

part 'stores_event.dart';
part 'stores_state.dart';

class StoresBloc extends Bloc<StoresEvent, StoresState> {
  StoresBloc({
    required storesRepository,
  })  : _storesRepository = storesRepository,
        super(StoresLoading());

  final StoresRepository _storesRepository;

  @override
  Stream<StoresState> mapEventToState(StoresEvent event) async* {
    if (event is LoadStores) {
      print("Bloc loading");
      final stores = await _storesRepository.getStores();
      yield StoresLoaded(
        stores: stores,
        restaurantes: stores.where((store) {
          if (store.category == 'restaurante')
            return true;
          else
            return false;
        }).toList(),
        tegnologia: stores.where((store) {
          if (store.category == 'tegnologia')
            return true;
          else
            return false;
        }).toList(),
      );
    } else if (event is LoadNewSotore) {
      //....
    }
  }

  // Future<void> _onLoadStores(LoadStores event, Emitter<StoresState> emit) {
  //   print("Bloc loading");
  //   // final stores = await _storesRepository.getStores();
  //   // yield StoresLoaded(stores: stores);
  //   return emit.onEach<List<Store>>(_storesRepository.getStores(),
  //       onData: (stores) => emit(StoresLoaded(stores: stores)));
  // }
}
