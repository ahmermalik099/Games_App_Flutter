// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'games_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Games _$GamesFromJson(Map<String, dynamic> json) => Games(
      Name: json['name'] as String? ?? '',
      image: json['background_image'] as String? ?? '',
      year: json['released'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      slug: json['slug'] as String? ?? '',
    );

Map<String, dynamic> _$GamesToJson(Games instance) => <String, dynamic>{
      'name': instance.Name,
      'background_image': instance.image,
      'released': instance.year,
      'id': instance.id,
      'slug': instance.slug,
    };
