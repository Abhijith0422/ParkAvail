import 'package:book_my_park/application/bloc/parkdata_bloc.dart';
import 'package:book_my_park/domain/core/injectable.dart';
import 'package:book_my_park/presentation/mainpage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getit<ParkdataBloc>()),
      ],
      child: MaterialApp(
        title: 'ParkAvail',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 46, 197, 222)),
          useMaterial3: true,
        ),
        home: MainPage(),
      ),
    );
  }
}
