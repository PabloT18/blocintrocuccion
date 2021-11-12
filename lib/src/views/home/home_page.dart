import 'package:delivery_app/src/logic/cubit/internet/internet_cubit.dart';
import 'package:delivery_app/src/models/store_model.dart';
import 'package:delivery_app/src/views/widgets/card_place.dart';
import 'package:delivery_app/src/views/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/src/views/home/widgets/home_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:delivery_app/src/logic/bloc/stores/stores_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<StoresBloc>().add(LoadStores());

    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return BlocListener<InternetCubit, InternetState>(
      listener: (contextListener, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.wife) {
          ScaffoldMessenger.of(contextListener).showSnackBar(const SnackBar(
            content: Text('Conectado por Wifi'),
          ));
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.mobile) {
          ScaffoldMessenger.of(contextListener).showSnackBar(const SnackBar(
            content: Text('Conectado por Datos'),
          ));
        } else if (state is InternetDisconnected) {
          ScaffoldMessenger.of(contextListener).showSnackBar(const SnackBar(
            content: Text('Sin Internet'),
          ));
        }
      },
      child: BlocBuilder<StoresBloc, StoresState>(
        builder: (context, state) {
          if (state is StoresLoading) {
            return LoadingIndicator();
          } else if (state is StoresLoaded)
            return Scaffold(
              key: _scaffoldKey,
              backgroundColor: Colors.white,
              appBar: CustomAppBar(
                scaffoldKey: _scaffoldKey,
              ),
              drawer: const CustomDrawer(),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 15.0),
                    const SearchBar(),
                    const SizedBox(height: 15.0),
                    const Categorias(),
                    SizedBox(height: 15.0),
                    if (state.restaurantes!.isNotEmpty) ...[
                      _BoxMainPlaces(
                        title: 'Los mejores restaurantes',
                        places: state.restaurantes!,
                      ),
                    ],
                    SizedBox(height: 10.0),
                    _BoxMainPlaces(
                      title: 'Lugares recomendados',
                      places: state.tegnologia!,
                    ),
                    SizedBox(height: 15.0)
                  ],
                ),
              ),
            );
          else {
            return Container();
          }
        },
      ),
    );
  }
}

class _BoxMainPlaces extends StatelessWidget {
  const _BoxMainPlaces({
    Key? key,
    required this.title,
    required this.places,
  }) : super(key: key);

  final String title;
  final List<Store> places;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              ...places.map((store) => NegocioCard(
                    store: store,
                  ))
            ]),
          ),
        ],
      ),
    );
  }
}
