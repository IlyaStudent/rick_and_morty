import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rick_and_morty/features/main_page/presentation/bloc/person_list_cubit/person_list_cubit.dart';
import 'package:rick_and_morty/features/main_page/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:rick_and_morty/features/main_page/presentation/pages/home_page.dart';
import 'package:rick_and_morty/locator_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PersonListCubit>(
            create: (context) => sl<PersonListCubit>()..loadPerson()),
        BlocProvider<PersonSearchBloc>(
            create: (context) => sl<PersonSearchBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const HomePage(),
      ),
    );
  }
}
