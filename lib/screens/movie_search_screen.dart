import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practical_test/blocs/search_bloc.dart';
import 'package:flutter_bloc_practical_test/blocs/search_event.dart';
import 'package:flutter_bloc_practical_test/blocs/search_state.dart';

class MovieSearchScreen extends StatefulWidget {
  const MovieSearchScreen({super.key});

  @override
  State<MovieSearchScreen> createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: TextField(
              decoration:
                  const InputDecoration(hintText: "Search for movies...",),
              controller: _searchController,
              onSubmitted: (query) {
                if (query.isNotEmpty) {
                  context.read<SearchBloc>().add(SearchMovies(query));
                }
              })),
      body: BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
        if (state is SearchInitial) {
          return const Center(
            child: Text('Search for a movie'),
          );
        } else if (state is SearchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SearchSuccess) {
          return ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return ListTile(
                  dense: true,
                  leading: Image.network(movie.poster),
                  title: Text(movie.title),
                  trailing: Text(movie.year),
                  subtitle: Text(movie.type.toUpperCase()),
                );
              });
        } else if (state is SearchFailure) {
          return Center(
            child: Text('Error: ${state.error}'),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
