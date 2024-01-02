import 'dart:convert';

List<CountriesResponseModel> countriesResponseModelFromJson(String str) =>
    List<CountriesResponseModel>.from(
        json.decode(str).map((x) => CountriesResponseModel.fromJson(x)));

String countriesResponseModelToJson(List<CountriesResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountriesResponseModel {
  String? name;
  String? code;
  FlagUrls? flagUrls;
  String? officialName;
  String? iso3;
  String? dialingCode;
  List<String>? currencyCodes;
  Emoji? emoji;
  String? tourismSlogan;
  List<double>? boundingbox;

  CountriesResponseModel({
    this.name,
    this.code,
    this.flagUrls,
    this.officialName,
    this.iso3,
    this.dialingCode,
    this.currencyCodes,
    this.emoji,
    this.tourismSlogan,
    this.boundingbox,
  });

  factory CountriesResponseModel.fromJson(Map<String, dynamic> json) =>
      CountriesResponseModel(
        name: json["name"],
        code: json["code"],
        flagUrls: json["flag_urls"] == null
            ? null
            : FlagUrls.fromJson(json["flag_urls"]),
        officialName: json["official_name"],
        iso3: json["iso_3"],
        dialingCode: json["dialing_code"],
        currencyCodes: json["currency_codes"] == null
            ? []
            : List<String>.from(json["currency_codes"]!.map((x) => x)),
        emoji: json["emoji"] == null ? null : Emoji.fromJson(json["emoji"]),
        tourismSlogan: json["tourism_slogan"],
        boundingbox: json["boundingbox"] == null
            ? []
            : List<double>.from(json["boundingbox"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "flag_urls": flagUrls?.toJson(),
        "official_name": officialName,
        "iso_3": iso3,
        "dialing_code": dialingCode,
        "currency_codes": currencyCodes == null
            ? []
            : List<dynamic>.from(currencyCodes!.map((x) => x)),
        "emoji": emoji?.toJson(),
        "tourism_slogan": tourismSlogan,
        "boundingbox": boundingbox == null
            ? []
            : List<dynamic>.from(boundingbox!.map((x) => x)),
      };
}

class Emoji {
  String? slackEmoji;
  String? discordEmoji;
  String? symbol;

  Emoji({
    this.slackEmoji,
    this.discordEmoji,
    this.symbol,
  });

  factory Emoji.fromJson(Map<String, dynamic> json) => Emoji(
        slackEmoji: json["slack_emoji"],
        discordEmoji: json["discord_emoji"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "slack_emoji": slackEmoji,
        "discord_emoji": discordEmoji,
        "symbol": symbol,
      };
}

class FlagUrls {
  String? svg;
  String? png;

  FlagUrls({
    this.svg,
    this.png,
  });

  factory FlagUrls.fromJson(Map<String, dynamic> json) => FlagUrls(
        svg: json["svg"],
        png: json["png"],
      );

  Map<String, dynamic> toJson() => {
        "svg": svg,
        "png": png,
      };
}
