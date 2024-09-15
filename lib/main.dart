import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopping_list_app/theme.dart';
import 'package:shopping_list_app/view/home_view.dart';
import 'package:shopping_list_app/cubit/item_cubit.dart';
import 'package:shopping_list_app/repository/item_repository.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      title: 'Shopping List App',
      home: BlocProvider(
        child: const HomeView(),
        create: (_) => ItemCubit(ItemsRepository()),
      ),
    );
  }
}
