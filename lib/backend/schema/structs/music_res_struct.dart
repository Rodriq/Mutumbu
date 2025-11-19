// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MusicResStruct extends BaseStruct {
  MusicResStruct({
    String? audioUrl1,
    String? audioUrl2,
    String? albumCover,
    String? genre,
    String? title,
  })  : _audioUrl1 = audioUrl1,
        _audioUrl2 = audioUrl2,
        _albumCover = albumCover,
        _genre = genre,
        _title = title;

  // "audioUrl1" field.
  String? _audioUrl1;
  String get audioUrl1 => _audioUrl1 ?? '';
  set audioUrl1(String? val) => _audioUrl1 = val;

  bool hasAudioUrl1() => _audioUrl1 != null;

  // "audioUrl2" field.
  String? _audioUrl2;
  String get audioUrl2 => _audioUrl2 ?? '';
  set audioUrl2(String? val) => _audioUrl2 = val;

  bool hasAudioUrl2() => _audioUrl2 != null;

  // "albumCover" field.
  String? _albumCover;
  String get albumCover => _albumCover ?? '';
  set albumCover(String? val) => _albumCover = val;

  bool hasAlbumCover() => _albumCover != null;

  // "genre" field.
  String? _genre;
  String get genre => _genre ?? '';
  set genre(String? val) => _genre = val;

  bool hasGenre() => _genre != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  static MusicResStruct fromMap(Map<String, dynamic> data) => MusicResStruct(
        audioUrl1: data['audioUrl1'] as String?,
        audioUrl2: data['audioUrl2'] as String?,
        albumCover: data['albumCover'] as String?,
        genre: data['genre'] as String?,
        title: data['title'] as String?,
      );

  static MusicResStruct? maybeFromMap(dynamic data) =>
      data is Map ? MusicResStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'audioUrl1': _audioUrl1,
        'audioUrl2': _audioUrl2,
        'albumCover': _albumCover,
        'genre': _genre,
        'title': _title,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'audioUrl1': serializeParam(
          _audioUrl1,
          ParamType.String,
        ),
        'audioUrl2': serializeParam(
          _audioUrl2,
          ParamType.String,
        ),
        'albumCover': serializeParam(
          _albumCover,
          ParamType.String,
        ),
        'genre': serializeParam(
          _genre,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
      }.withoutNulls;

  static MusicResStruct fromSerializableMap(Map<String, dynamic> data) =>
      MusicResStruct(
        audioUrl1: deserializeParam(
          data['audioUrl1'],
          ParamType.String,
          false,
        ),
        audioUrl2: deserializeParam(
          data['audioUrl2'],
          ParamType.String,
          false,
        ),
        albumCover: deserializeParam(
          data['albumCover'],
          ParamType.String,
          false,
        ),
        genre: deserializeParam(
          data['genre'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MusicResStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MusicResStruct &&
        audioUrl1 == other.audioUrl1 &&
        audioUrl2 == other.audioUrl2 &&
        albumCover == other.albumCover &&
        genre == other.genre &&
        title == other.title;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([audioUrl1, audioUrl2, albumCover, genre, title]);
}

MusicResStruct createMusicResStruct({
  String? audioUrl1,
  String? audioUrl2,
  String? albumCover,
  String? genre,
  String? title,
}) =>
    MusicResStruct(
      audioUrl1: audioUrl1,
      audioUrl2: audioUrl2,
      albumCover: albumCover,
      genre: genre,
      title: title,
    );
