import 'dart:convert';

class McuModel {
  McuModel({
    this.mcu,
  });

  final List<Mcu>? mcu;

  factory McuModel.fromJson(String str) => McuModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory McuModel.fromMap(Map<String, dynamic> json) => McuModel(
        mcu: json["mcu"] == null
            ? []
            : List<Mcu>.from(json["mcu"]!.map((x) => Mcu.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "mcu":
            mcu == null ? [] : List<dynamic>.from(mcu!.map((x) => x.toMap())),
      };
}

class Mcu {
  Mcu({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final DateTime? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  factory Mcu.fromJson(String str) => Mcu.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Mcu.fromMap(Map<String, dynamic> json) => Mcu(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"],
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toMap() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
