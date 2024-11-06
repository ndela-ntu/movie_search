import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/search_bloc.dart';
import 'screens/movie_search_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(
    MaterialApp(
      title: 'Movie Search',
      home: BlocProvider(
        create: (_) => SearchBloc(),
        child: const MovieSearchScreen(),
      ),
    ),
  );
}
