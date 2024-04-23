import 'package:bmi_task/bloc_observer.dart';
import 'package:bmi_task/features/auth/views/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/view_model/auth_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyCf-JUZBqNxtH-Ed8dIFefmK1IIgqMxgzQ',
        appId: 'com.example.bmi_task',
        messagingSenderId: 'sendid',
        projectId: 'bmitask-53b50',
        storageBucket: 'bmitask-53b50.appspot.com',
      )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          // scaffoldBackgroundColor: AppUI.whiteColor,
        ),
        home: LoginView(),
      ),
    );
  }
}
