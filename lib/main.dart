import 'package:connectivity/connectivity.dart';
import 'package:delivery_app/src/logic/bloc/stores/stores_bloc.dart';
import 'package:delivery_app/src/logic/cubit/internet/internet_cubit.dart';
import 'package:delivery_app/src/logic/simple_bloc_observer.dart';
import 'package:delivery_app/src/services/firebase/stores_reposory_impl.dart';
import 'package:delivery_app/src/utils/app_routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_core/firebase_core.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   Bloc.observer = SimpleBlocObserver();
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _initialized = false;
//   bool _error = false;

//   void initializeFlutterFire() async {
//     try {
//       await Firebase.initializeApp();
//       setState(() {
//         _initialized = true;
//       });
//     } catch (e) {
//       setState(() {
//         _error = true;
//       });
//     }
//   }

//   @override
//   void initState() {
//     initializeFlutterFire();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_error) return _container('Error', Colors.red);

//     if (!_initialized) return _container('Loading', Colors.blue);
//     print('dsafdsaf');

//     return BlocProvider(
//       create: (context) => StoresBloc(
//         storesRepository: FirebaseStoresRepository(),
//       ),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Delivery App',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         initialRoute: '/',
//         routes: AppRoutes.getRoutes(),
//       ),
//     );
//   }

//   Widget _container(String title, Color color) {
//     return Container(
//       color: Colors.white,
//       width: double.infinity,
//       height: double.infinity,
//       alignment: Alignment.center,
//       child: Text(title,
//           style: TextStyle(color: color), textDirection: TextDirection.ltr),
//     );
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await Firebase.initializeApp();

  runApp(MyApp(
    Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp(this.connectivity);
  final Connectivity connectivity;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StoresBloc(
            storesRepository: FirebaseStoresRepository(),
          ),
        ),
        BlocProvider<InternetCubit>(
            create: (interncetCubitContex) =>
                InternetCubit(connectivity: connectivity)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Delivery App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: AppRoutes.getRoutes(),
      ),
    );
  }
}
