import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'List_Products/Screens/Splash_Screen.dart';
import 'List_Products/data/Repository/Item_repository.dart';
import 'List_Products/StateManagement/item_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ItemBloc(ItemRepository())..add(FetchItems()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopee App',
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        // ),
        home: SplashScreen(),
      ),
    );
  }
}
