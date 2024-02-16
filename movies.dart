class Movies{
  String title;
  String backDropPath;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  double voteAverage;

  Movies({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage, 
    required this.posterPath,
  });

  factory Movies.fromJson(Map<String ,dynamic> json){
    return Movies(
        title: json["title"],
        backDropPath: json["backdrop_path"],
        originalTitle:json ["original_title"],
        overview: json ["overview"],
        releaseDate:json ["release_date"],
        voteAverage:json ["vote_average"].toDouble(), 
        posterPath: json["poster_path"],
        
    );
  }

}
