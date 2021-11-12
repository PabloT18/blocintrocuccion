import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';
import 'package:connectivity/connectivity.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  InternetCubit({this.connectivity}) : super(InternetLoading()) {
    monitorInternetCubit();
  }

  final Connectivity? connectivity;

  late StreamSubscription connectivityStreamSubscription;
  var isDeviceConnected = false;

  StreamSubscription<ConnectivityResult> monitorInternetCubit() {
    return connectivityStreamSubscription =
        connectivity!.onConnectivityChanged.listen((connectivityResult) async {
      if (connectivityResult == ConnectivityResult.mobile) {
        print('Internet Cubit: Mobile');
        final isDeviceConnected =
            await InternetConnectionChecker().hasConnection;
        if (isDeviceConnected) {
          emitInternetConnected(ConnectionType.mobile);
        } else {
          emitInternetDisonnected();
        }
      } else if (connectivityResult == ConnectivityResult.wifi) {
        print('Internet Cubit: wifi');

        final isDeviceConnected =
            await InternetConnectionChecker().hasConnection;
        if (isDeviceConnected) {
          emitInternetConnected(ConnectionType.wife);
        } else {
          emitInternetDisonnected();
        }
      } else if (connectivityResult == ConnectivityResult.none) {
        print('Internet Cubit: Disconected');

        emitInternetDisonnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType connectionType) =>
      emit(InternetConnected(connectionType: connectionType));

  void emitInternetDisonnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
