// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_details_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetMovieDetailsResponseAdapter
    extends TypeAdapter<GetMovieDetailsResponse> {
  @override
  final int typeId = 4;

  @override
  GetMovieDetailsResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetMovieDetailsResponse(
      status: fields[0] as String?,
      statusMessage: fields[1] as String?,
      data: fields[2] as Data?,
    );
  }

  @override
  void write(BinaryWriter writer, GetMovieDetailsResponse obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.statusMessage)
      ..writeByte(2)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetMovieDetailsResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 5;

  @override
  Data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data(
      movie: fields[0] as Movie?,
    );
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.movie);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MovieAdapter extends TypeAdapter<Movie> {
  @override
  final int typeId = 6;

  @override
  Movie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Movie(
      id: fields[0] as int?,
      url: fields[1] as String?,
      imdbCode: fields[2] as String?,
      title: fields[3] as String?,
      titleEnglish: fields[4] as String?,
      titleLong: fields[5] as String?,
      slug: fields[6] as String?,
      year: fields[7] as int?,
      rating: fields[8] as double?,
      runtime: fields[9] as int?,
      genres: (fields[10] as List?)?.cast<String>(),
      likeCount: fields[11] as int?,
      descriptionIntro: fields[12] as String?,
      descriptionFull: fields[13] as String?,
      ytTrailerCode: fields[14] as String?,
      language: fields[15] as String?,
      mpaRating: fields[16] as String?,
      backgroundImage: fields[17] as String?,
      backgroundImageOriginal: fields[18] as String?,
      smallCoverImage: fields[19] as String?,
      mediumCoverImage: fields[20] as String?,
      largeCoverImage: fields[21] as String?,
      torrents: (fields[22] as List?)?.cast<Torrents>(),
      dateUploaded: fields[23] as String?,
      dateUploadedUnix: fields[24] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Movie obj) {
    writer
      ..writeByte(25)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.imdbCode)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.titleEnglish)
      ..writeByte(5)
      ..write(obj.titleLong)
      ..writeByte(6)
      ..write(obj.slug)
      ..writeByte(7)
      ..write(obj.year)
      ..writeByte(8)
      ..write(obj.rating)
      ..writeByte(9)
      ..write(obj.runtime)
      ..writeByte(10)
      ..write(obj.genres)
      ..writeByte(11)
      ..write(obj.likeCount)
      ..writeByte(12)
      ..write(obj.descriptionIntro)
      ..writeByte(13)
      ..write(obj.descriptionFull)
      ..writeByte(14)
      ..write(obj.ytTrailerCode)
      ..writeByte(15)
      ..write(obj.language)
      ..writeByte(16)
      ..write(obj.mpaRating)
      ..writeByte(17)
      ..write(obj.backgroundImage)
      ..writeByte(18)
      ..write(obj.backgroundImageOriginal)
      ..writeByte(19)
      ..write(obj.smallCoverImage)
      ..writeByte(20)
      ..write(obj.mediumCoverImage)
      ..writeByte(21)
      ..write(obj.largeCoverImage)
      ..writeByte(22)
      ..write(obj.torrents)
      ..writeByte(23)
      ..write(obj.dateUploaded)
      ..writeByte(24)
      ..write(obj.dateUploadedUnix);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TorrentsAdapter extends TypeAdapter<Torrents> {
  @override
  final int typeId = 7;

  @override
  Torrents read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Torrents(
      url: fields[0] as String?,
      hash: fields[1] as String?,
      quality: fields[2] as String?,
      type: fields[3] as String?,
      isRepack: fields[4] as String?,
      videoCodec: fields[5] as String?,
      bitDepth: fields[6] as String?,
      audioChannels: fields[7] as String?,
      seeds: fields[8] as int?,
      peers: fields[9] as int?,
      size: fields[10] as String?,
      sizeBytes: fields[11] as int?,
      dateUploaded: fields[12] as String?,
      dateUploadedUnix: fields[13] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Torrents obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.hash)
      ..writeByte(2)
      ..write(obj.quality)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.isRepack)
      ..writeByte(5)
      ..write(obj.videoCodec)
      ..writeByte(6)
      ..write(obj.bitDepth)
      ..writeByte(7)
      ..write(obj.audioChannels)
      ..writeByte(8)
      ..write(obj.seeds)
      ..writeByte(9)
      ..write(obj.peers)
      ..writeByte(10)
      ..write(obj.size)
      ..writeByte(11)
      ..write(obj.sizeBytes)
      ..writeByte(12)
      ..write(obj.dateUploaded)
      ..writeByte(13)
      ..write(obj.dateUploadedUnix);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TorrentsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
