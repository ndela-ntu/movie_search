class Movie {
  final String title;
  final String year;
  final String poster;
  final String type;

  Movie({
    required this.title,
    required this.year,
    required this.poster,
    required this.type,
  });

  factory Movie.fromJSON(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'] as String,
      year: json['Year'] as String,
      poster: json['Poster'] as String,
      type: json['Type'] as String,
    );
  }
}
