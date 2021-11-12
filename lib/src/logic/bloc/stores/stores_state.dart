part of 'stores_bloc.dart';

@immutable
abstract class StoresState {
  const StoresState();
}

class StoresLoading extends StoresState {}

class StoresLoaded extends StoresState {
  const StoresLoaded({
    this.stores,
    this.restaurantes,
    this.bebidas,
    this.tegnologia,
  });

  final List<Store>? stores;
  final List<Store>? restaurantes;
  final List<Store>? bebidas;
  final List<Store>? tegnologia;


  StoresLoaded copyWith({
    List<Store>? stores,
    List<Store>? restaurantes,
    List<Store>? bebidas,
    List<Store>? tegnologia,
  }) =>
      StoresLoaded(
        stores: stores ?? this.stores,
        restaurantes: restaurantes ?? this.restaurantes,
        bebidas: bebidas ?? this.bebidas,
        tegnologia: tegnologia ?? this.tegnologia,

      );
}

class StoresNotLoaded extends StoresState {}
