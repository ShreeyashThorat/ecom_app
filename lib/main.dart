import 'package:ecom_app/logic/bottom%20navigation/cubit/bottom_nav_cubit.dart';
import 'package:ecom_app/views/bottom%20navigation/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavCubit()),
      ],
      child: MaterialApp(
        title: 'E-com app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
        ),
        home: const BottomNav(),
      ),
    );
  }
}
