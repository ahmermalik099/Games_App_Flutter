import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

part 'games_model.g.dart';

@JsonSerializable()
class Games {
  Games({this.Name = '', this.image = '', this.year = '', this.id = 0,this.slug=''});

  @JsonKey(name: 'name')
  String Name;

  @JsonKey(name: 'background_image')
  String image;

  @JsonKey(name: 'released')
  String year;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'slug')
  String slug;


  factory Games.fromJson(Map<String, dynamic> json) => _$GamesFromJson(json);
  Map<String, dynamic> toJson() => _$GamesToJson(this);

}


//built runner commands

// flutter clean
// flutter pub get
// flutter packages pub run build_runner build --delete-conflicting-outputs