import 'package:freezed_annotation/freezed_annotation.dart';

part 'tmdb_result.freezed.dart';
part 'tmdb_result.g.dart';

@freezed
class TmdbResult with _$TmdbResult {
  factory TmdbResult({
    Dates? dates,
    int? page,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'total_results') int? totalResults,
    List<TmdbMovie>? results,
  }) = _TmdbResult;

  factory TmdbResult.fromJson(Map<String, dynamic> json) =>
      _$TmdbResultFromJson(json);
}

@freezed
class Dates with _$Dates {
  factory Dates({
    String? maximum,
    String? minimum,
  }) = _Dates;

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);
}

@freezed
class TmdbMovie with _$TmdbMovie {
  factory TmdbMovie({
    bool? adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_ids') List<int>? genreIds,
    int? id,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    String? overview,
    double? popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date') String? releaseDate,
    String? title,
    bool? video,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
  }) = _TmdbMovie;

  factory TmdbMovie.fromJson(Map<String, dynamic> json) =>
      _$TmdbMovieFromJson(json);
}
