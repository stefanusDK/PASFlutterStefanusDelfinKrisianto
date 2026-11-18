// To parse this JSON data, do
//
//     final feat = featFromJson(jsonString);

import 'dart:convert';

Feat featFromJson(String str) => Feat.fromJson(json.decode(str));

String featToJson(Feat data) => json.encode(data.toJson());

class Feat {
    final List<Map<String, String?>> teams;

    Feat({
        required this.teams,
    });

    factory Feat.fromJson(Map<String, dynamic> json) => Feat(
        teams: List<Map<String, String?>>.from(json["teams"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
    );

    Map<String, dynamic> toJson() => {
        "teams": List<dynamic>.from(teams.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    };
}