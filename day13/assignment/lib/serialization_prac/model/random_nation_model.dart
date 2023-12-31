class RandomDataModel {
  final int id; // : 4144,
  final String uid; // : "b9956247-4e07-4614-bde7-b185cb7cfdad",
  final String city; // : "Welchburgh",
  final String street_name; // : "Price Brooks",
  final String street_address; // : "80338 Violette Row",
  final String secondary_address; // : "Apt. 767",
  final String building_number; // : "874",
  final String mail_box; // : "PO Box 2732",
  final String community; // : "Park Square",
  final String zip_code; // : "77798-7999",
  final String zip; // : "92595-3201",
  final String postcode; // : "91769",
  final String time_zone; // : "Asia/Chongqing",
  final String street_suffix; // : "Forges",
  final String city_suffix; // : "view",
  final String city_prefix; // : "East",
  final String state; // : "Montana",
  final String state_abbr; // : "OK",
  final String country; // : "Macedonia",
  final String country_code; // : "AR",
  final double latitude; // : 14.359000496179263,
  final double longitude; // : -3.5523866334594913,
  final String
      full_address; // : "Suite 253 1723 Cummings Shoals, Lake Trumanshire, OH 89986-0441"

  RandomDataModel({
    required this.id,
    required this.uid,
    required this.city,
    required this.street_name,
    required this.street_address,
    required this.secondary_address,
    required this.building_number,
    required this.mail_box,
    required this.community,
    required this.zip_code,
    required this.zip,
    required this.postcode,
    required this.time_zone,
    required this.street_suffix,
    required this.city_suffix,
    required this.city_prefix,
    required this.state,
    required this.state_abbr,
    required this.country,
    required this.country_code,
    required this.latitude,
    required this.longitude,
    required this.full_address,
  });

  factory RandomDataModel.fromJson({required Map<String, dynamic> json}) {
    return RandomDataModel(
      id: json['id'],
      uid: json['uid'],
      city: json['city'],
      street_name: json['street_name'],
      street_address: json['street_address'],
      secondary_address: json['secondary_address'],
      building_number: json['building_number'],
      mail_box: json['mail_box'],
      community: json['community'],
      zip_code: json['zip_code'],
      zip: json['zip'],
      postcode: json['postcode'],
      time_zone: json['time_zone'],
      street_suffix: json['street_suffix'],
      city_suffix: json['city_suffix'],
      city_prefix: json['city_prefix'],
      state: json['state'],
      state_abbr: json['state_abbr'],
      country: json['country'],
      country_code: json['country_code'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      full_address: json['full_address'],
    );
  }

  @override
  String toString() {
    return '''RadomDataModel is ...    
id: $id,
uid: $uid,
city: $city,
street_name: $street_name,
street_address: $street_address,
secondary_address: $secondary_address,
building_number: $building_number,
mail_box: $mail_box,
community: $community,
zip_code: $zip_code,
zip: $zip,
postcode: $postcode,
time_zone: $time_zone,
street_suffix: $street_suffix,
city_suffix: $city_suffix,
city_prefix: $city_prefix,
state: $state,
state_abbr: $state_abbr,
country: $country,
country_code: $country_code,
latitude: $latitude,
longitude: $longitude,
full_address: $full_address,
    ''';
  }
}
