import 'package:hive/hive.dart';
part 'get_all_movie_response.g.dart';

@HiveType(typeId: 0)
class GetAllMovieResponse {
  @HiveField(0)
  String? status;
  @HiveField(1)
  String? statusMessage;
  @HiveField(2)
  Data? data;

  GetAllMovieResponse({this.status, this.statusMessage, this.data});

  GetAllMovieResponse.fromJson(dynamic json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['status_message'] = statusMessage;
    if (data != null) {
      map['data'] = data?.toJson();
    }

    return map;
  }
}

@HiveType(typeId: 1)
class Data {
  Data({this.movieCount, this.limit, this.pageNumber, this.movies});

  Data.fromJson(dynamic json) {
    movieCount = json['movie_count'];
    limit = json['limit'];
    pageNumber = json['page_number'];
    if (json['movies'] != null) {
      movies = [];
      json['movies'].forEach((v) {
        movies?.add(Movies.fromJson(v));
      });
    }
  }

  @HiveField(0)
  int? movieCount;
  @HiveField(1)
  int? limit;
  @HiveField(2)
  int? pageNumber;
  @HiveField(3)
  List<Movies>? movies;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['movie_count'] = movieCount;
    map['limit'] = limit;
    map['page_number'] = pageNumber;
    if (movies != null) {
      map['movies'] = movies?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

@HiveType(typeId: 2)
class Movies {
  Movies({
    this.id,
    this.url,
    this.imdbCode,
    this.title,
    this.titleEnglish,
    this.titleLong,
    this.slug,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.summary,
    this.descriptionFull,
    this.synopsis,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.state,
    this.torrents,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  Movies.fromJson(dynamic json) {
    id = json['id'];
    url = json['url'];
    imdbCode = json['imdb_code'];
    title = json['title'];
    titleEnglish = json['title_english'];
    titleLong = json['title_long'];
    slug = json['slug'];
    year = json['year'];
    rating = (json['rating'] as num?)?.toDouble();
    runtime = json['runtime'];
    genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    summary = json['summary'];
    descriptionFull = json['description_full'];
    synopsis = json['synopsis'];
    ytTrailerCode = json['yt_trailer_code'];
    language = json['language'];
    mpaRating = json['mpa_rating'];
    backgroundImage = json['background_image'];
    backgroundImageOriginal = json['background_image_original'];
    smallCoverImage = json['small_cover_image'];
    mediumCoverImage = json['medium_cover_image'];
    largeCoverImage = json['large_cover_image'];
    state = json['state'];
    if (json['torrents'] != null) {
      torrents = [];
      json['torrents'].forEach((v) {
        torrents?.add(Torrents.fromJson(v));
      });
    }
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }

  @HiveField(0)
  int? id;
  @HiveField(1)
  String? url;
  @HiveField(2)
  String? imdbCode;
  @HiveField(3)
  String? title;
  @HiveField(4)
  String? titleEnglish;
  @HiveField(5)
  String? titleLong;
  @HiveField(6)
  String? slug;
  @HiveField(7)
  int? year;
  @HiveField(8)
  double? rating;
  @HiveField(9)
  int? runtime;
  @HiveField(10)
  List<String>? genres;
  @HiveField(11)
  String? summary;
  @HiveField(12)
  String? descriptionFull;
  @HiveField(13)
  String? synopsis;
  @HiveField(14)
  String? ytTrailerCode;
  @HiveField(15)
  String? language;
  @HiveField(16)
  String? mpaRating;
  @HiveField(17)
  String? backgroundImage;
  @HiveField(18)
  String? backgroundImageOriginal;
  @HiveField(19)
  String? smallCoverImage;
  @HiveField(20)
  String? mediumCoverImage;
  @HiveField(21)
  String? largeCoverImage;
  @HiveField(22)
  String? state;
  @HiveField(23)
  List<Torrents>? torrents;
  @HiveField(24)
  String? dateUploaded;
  @HiveField(25)
  int? dateUploadedUnix;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    map['imdb_code'] = imdbCode;
    map['title'] = title;
    map['title_english'] = titleEnglish;
    map['title_long'] = titleLong;
    map['slug'] = slug;
    map['year'] = year;
    map['rating'] = rating;
    map['runtime'] = runtime;
    map['genres'] = genres;
    map['summary'] = summary;
    map['description_full'] = descriptionFull;
    map['synopsis'] = synopsis;
    map['yt_trailer_code'] = ytTrailerCode;
    map['language'] = language;
    map['mpa_rating'] = mpaRating;
    map['background_image'] = backgroundImage;
    map['background_image_original'] = backgroundImageOriginal;
    map['small_cover_image'] = smallCoverImage;
    map['medium_cover_image'] = mediumCoverImage;
    map['large_cover_image'] = largeCoverImage;
    map['state'] = state;
    if (torrents != null) {
      map['torrents'] = torrents?.map((v) => v.toJson()).toList();
    }
    map['date_uploaded'] = dateUploaded;
    map['date_uploaded_unix'] = dateUploadedUnix;
    return map;
  }
}

@HiveType(typeId: 3)
class Torrents {
  Torrents({
    this.url,
    this.hash,
    this.quality,
    this.type,
    this.isRepack,
    this.videoCodec,
    this.bitDepth,
    this.audioChannels,
    this.seeds,
    this.peers,
    this.size,
    this.sizeBytes,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  Torrents.fromJson(dynamic json) {
    url = json['url'];
    hash = json['hash'];
    quality = json['quality'];
    type = json['type'];
    isRepack = json['is_repack'];
    videoCodec = json['video_codec'];
    bitDepth = json['bit_depth'];
    audioChannels = json['audio_channels'];
    seeds = json['seeds'];
    peers = json['peers'];
    size = json['size'];
    sizeBytes = json['size_bytes'];
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }

  @HiveField(0)
  String? url;
  @HiveField(1)
  String? hash;
  @HiveField(2)
  String? quality;
  @HiveField(3)
  String? type;
  @HiveField(4)
  String? isRepack;
  @HiveField(5)
  String? videoCodec;
  @HiveField(6)
  String? bitDepth;
  @HiveField(7)
  String? audioChannels;
  @HiveField(8)
  int? seeds;
  @HiveField(9)
  int? peers;
  @HiveField(10)
  String? size;
  @HiveField(11)
  int? sizeBytes;
  @HiveField(12)
  String? dateUploaded;
  @HiveField(13)
  int? dateUploadedUnix;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['hash'] = hash;
    map['quality'] = quality;
    map['type'] = type;
    map['is_repack'] = isRepack;
    map['video_codec'] = videoCodec;
    map['bit_depth'] = bitDepth;
    map['audio_channels'] = audioChannels;
    map['seeds'] = seeds;
    map['peers'] = peers;
    map['size'] = size;
    map['size_bytes'] = sizeBytes;
    map['date_uploaded'] = dateUploaded;
    map['date_uploaded_unix'] = dateUploadedUnix;
    return map;
  }
}
