import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../StateManagement/Item_bloc.dart';
import '../data/Repository/Item_repository.dart';
import 'Item_Screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(
          child: Text(
            'Shopee',
          style: TextStyle(
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          )),
      backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => ItemBloc(ItemRepository())..add(FetchItems()),
        child: BlocBuilder<ItemBloc, ItemState>(
          builder: (context, state) {
            if (state is ItemLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ItemLoaded) {
              return ListView.builder(
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  return ItemCard(item: state.items[index]);
                },
              );
            } else if (state is ItemError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
