import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practical_test/blocs/search_event.dart';
import 'package:flutter_bloc_practical_test/blocs/search_state.dart';
import 'package:flutter_bloc_practical_test/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

final ombdApiKey = dotenv.env['OMDB_API_KEY'] ?? '';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchMovies>(_onSearchMovies);
  }

  Future<void> _onSearchMovies(
      SearchMovies event, Emitter<SearchState> emit) async {
    emit(SearchLoading());

    try {
      final response = await http.get(Uri.parse(
          'http://www.omdbapi.com/?s=${event.query}&apikey=$ombdApiKey'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['Search'] != null) {
          final movies = (data['Search'] as List)
              .map((movie) => Movie.fromJSON(movie))
              .toList();

          emit(SearchSuccess(movies));
        } else {
          emit(SearchFailure('Movie/series not found'));
        }
      } else {
        emit(SearchFailure('Error fetching movie data.'));
      }
    } catch (e) {
      emit(SearchFailure('Error: $e'));
    }
  }
}
