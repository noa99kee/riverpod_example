// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TmdbResult _$$_TmdbResultFromJson(Map<String, dynamic> json) =>
    _$_TmdbResult(
      dates: json['dates'] == null
          ? null
          : Dates.fromJson(json['dates'] as Map<String, dynamic>),
      page: json['page'] as int?,
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => TmdbMovie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TmdbResultToJson(_$_TmdbResult instance) =>
    <String, dynamic>{
      'dates': instance.dates,
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };

_$_Dates _$$_DatesFromJson(Map<String, dynamic> json) => _$_Dates(
      maximum: json['maximum'] as String?,
      minimum: json['minimum'] as String?,
    );

Map<String, dynamic> _$$_DatesToJson(_$_Dates instance) => <String, dynamic>{
      'maximum': instance.maximum,
      'minimum': instance.minimum,
    };

_$_TmdbMovie _$$_TmdbMovieFromJson(Map<String, dynamic> json) => _$_TmdbMovie(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      genreIds:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      id: json['id'] as int?,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String?,
      video: json['video'] as bool?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
    );

Map<String, dynamic> _$$_TmdbMovieToJson(_$_TmdbMovie instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
