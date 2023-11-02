import 'package:hive/hive.dart';
part 'popular_people_model.g.dart';
class PopularPeopleResponse {
    int page;
    List<PopularPeople> results;
    int totalPages;
    int totalResults;

    PopularPeopleResponse({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory PopularPeopleResponse.fromJson(Map<String, dynamic> json) => PopularPeopleResponse(
        page: json["page"],
        results: List<PopularPeople>.from(json["results"].map((x) => PopularPeople.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}
@HiveType(typeId: 0)
class PopularPeople extends HiveObject {
   @HiveField(0)
    bool adult;
    @HiveField(1)
    int gender;
    @HiveField(2)
    int id;
    @HiveField(3)
    String knownForDepartment;
    @HiveField(4)
    String name;
    @HiveField(5)
    String originalName;
    @HiveField(6)
    double popularity;
    @HiveField(7)
    String profilePath;
    @HiveField(8)
    List<KnownFor> knownFor;

    PopularPeople({
        required this.adult,
        required this.gender,
        required this.id,
        required this.knownForDepartment,
        required this.name,
        required this.originalName,
        required this.popularity,
        required this.profilePath,
        required this.knownFor,
    });

    factory PopularPeople.fromJson(Map<String, dynamic> json) => PopularPeople(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"],
        knownFor: List<KnownFor>.from(json["known_for"].map((x) => KnownFor.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartmentValues.reverse[knownForDepartment],
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath,
        "known_for": List<dynamic>.from(knownFor.map((x) => x.toJson())),
    };
}
@HiveType(typeId: 1)
class KnownFor {
    bool? adult;
    String? backdropPath;
    int? id;
    @HiveField(0)
    String? title;
    OriginalLanguage? originalLanguage;
    String? originalTitle;
    String? overview;
    String? posterPath;
    MediaType? mediaType;
    List<int>? genreIds;
    double? popularity;
    DateTime? releaseDate;
    bool? video;
    double? voteAverage;
    int? voteCount;
    @HiveField(1)
    String? name;
    String? originalName;
    DateTime? firstAirDate;
    List<String>? originCountry;

    KnownFor({
        this.adult,
        this.backdropPath,
        this.id,
        this.title,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.posterPath,
        this.mediaType,
        this.genreIds,
        this.popularity,
        this.releaseDate,
        this.video,
        this.voteAverage,
        this.voteCount,
        this.name,
        this.originalName,
        this.firstAirDate,
        this.originCountry,
    });

    factory KnownFor.fromJson(Map<String, dynamic> json) => KnownFor(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: mediaTypeValues.map[json["media_type"]]!,
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        popularity: json["popularity"]?.toDouble(),
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        name: json["name"],
        originalName: json["original_name"],
        firstAirDate: json["first_air_date"] == null ? null : DateTime.parse(json["first_air_date"]),
        originCountry: json["origin_country"] == null ? [] : List<String>.from(json["origin_country"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "id": id,
        "title": title,
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaTypeValues.reverse[mediaType],
        "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
        "popularity": popularity,
        "release_date": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "name": name,
        "original_name": originalName,
        "first_air_date": "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
        "origin_country": originCountry == null ? [] : List<dynamic>.from(originCountry!.map((x) => x)),
    };
}

enum MediaType {
    MOVIE,
    TV
}

final mediaTypeValues = EnumValues({
    "movie": MediaType.MOVIE,
    "tv": MediaType.TV
});

enum OriginalLanguage {
    EN,
    KO,
    TL
}

final originalLanguageValues = EnumValues({
    "en": OriginalLanguage.EN,
    "ko": OriginalLanguage.KO,
    "tl": OriginalLanguage.TL
});

enum KnownForDepartment {
    ACTING
}

final knownForDepartmentValues = EnumValues({
    "Acting": KnownForDepartment.ACTING
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
