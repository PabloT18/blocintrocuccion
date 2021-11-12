part of 'internet_cubit.dart';

enum ConnectionType {
  wife,
  mobile,
}

@immutable
abstract class InternetState {}

class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {
  InternetConnected({this.connectionType});

  final ConnectionType? connectionType;
}

class InternetDisconnected extends InternetState {}
