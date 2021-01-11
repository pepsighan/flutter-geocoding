import 'package:meta/meta.dart';

/// Contains detailed address information.
@immutable
class Address {
  /// Constructs an instance with the given values for testing. [Address]
  /// instances constructed this way won't actually reflect any real information
  /// from the platform, just whatever was passed in at construction time.
  Address({
    this.name,
    this.street,
    this.isoCountryCode,
    this.country,
    this.postalCode,
    this.administrativeArea,
    this.subAdministrativeArea,
    this.locality,
    this.subLocality,
    this.thoroughfare,
    this.subThoroughfare,
    this.latitude,
    this.longitude,
  });

  Address._({
    this.name,
    this.street,
    this.isoCountryCode,
    this.country,
    this.postalCode,
    this.administrativeArea,
    this.subAdministrativeArea,
    this.locality,
    this.subLocality,
    this.thoroughfare,
    this.subThoroughfare,
    this.latitude,
    this.longitude,
  });

  /// The name associated with the address.
  final String name;

  /// The street associated with the address.
  final String street;

  /// The abbreviated country name, according to the two letter (alpha-2) [ISO standard](https://www.iso.org/iso-3166-country-codes.html).
  final String isoCountryCode;

  /// The name of the country associated with the address.
  final String country;

  /// The postal code associated with the address.
  final String postalCode;

  /// The name of the state or province associated with the address.
  final String administrativeArea;

  /// Additional administrative area information for the address.
  final String subAdministrativeArea;

  /// The name of the city associated with the address.
  final String locality;

  /// Additional city-level information for the address.
  final String subLocality;

  /// The street address associated with the address.
  final String thoroughfare;

  /// Additional street address information for the address.
  final String subThoroughfare;

  /// The latitude associated with the address.
  final double latitude;

  /// The longitude associated with the address.
  final double longitude;

  @override
  bool operator ==(dynamic o) =>
      o is Address &&
      o.administrativeArea == administrativeArea &&
      o.country == country &&
      o.isoCountryCode == isoCountryCode &&
      o.locality == locality &&
      o.name == name &&
      o.postalCode == postalCode &&
      o.street == street &&
      o.subAdministrativeArea == subAdministrativeArea &&
      o.subLocality == subLocality &&
      o.subThoroughfare == subThoroughfare &&
      o.thoroughfare == thoroughfare &&
      o.latitude == latitude &&
      o.longitude == longitude;

  @override
  int get hashCode =>
      administrativeArea.hashCode ^
      country.hashCode ^
      isoCountryCode.hashCode ^
      locality.hashCode ^
      name.hashCode ^
      postalCode.hashCode ^
      street.hashCode ^
      subAdministrativeArea.hashCode ^
      subLocality.hashCode ^
      subThoroughfare.hashCode ^
      thoroughfare.hashCode ^
      latitude.hashCode ^
      longitude.hashCode;

  /// Converts a list of [Map] instances to a list of [Address] instances.
  static List<Address> fromMaps(dynamic message) {
    if (message == null) {
      throw ArgumentError('The parameter \'message\' should not be null.');
    }

    final List<Address> list = message.map<Address>(fromMap).toList();
    return list;
  }

  /// Converts the supplied [Map] to an instance of the [Address] class.
  static Address fromMap(dynamic message) {
    if (message == null) {
      throw ArgumentError('The parameter \'message\' should not be null.');
    }

    final Map<dynamic, dynamic> placemarkMap = message;

    return Address._(
      name: placemarkMap['name'] ?? '',
      street: placemarkMap['street'] ?? '',
      isoCountryCode: placemarkMap['isoCountryCode'] ?? '',
      country: placemarkMap['country'] ?? '',
      postalCode: placemarkMap['postalCode'] ?? '',
      administrativeArea: placemarkMap['administrativeArea'] ?? '',
      subAdministrativeArea: placemarkMap['subAdministrativeArea'] ?? '',
      locality: placemarkMap['locality'] ?? '',
      subLocality: placemarkMap['subLocality'] ?? '',
      thoroughfare: placemarkMap['thoroughfare'] ?? '',
      subThoroughfare: placemarkMap['subThoroughfare'] ?? '',
      latitude: placemarkMap['latitude'] ?? null,
      longitude: placemarkMap['longitude'] ?? null,
    );
  }

  /// Converts the [Address] instance into a [Map] instance that can be
  /// serialized to JSON.
  Map<String, dynamic> toJson() => {
        'name': name,
        'street': street,
        'isoCountryCode': isoCountryCode,
        'country': country,
        'postalCode': postalCode,
        'administrativeArea': administrativeArea,
        'subAdministrativeArea': subAdministrativeArea,
        'locality': locality,
        'subLocality': subLocality,
        'thoroughfare': thoroughfare,
        'subThoroughfare': subThoroughfare,
        'latitude': latitude,
        'longitude': longitude,
      };

  @override
  String toString() {
    return '''
      Name: $name, 
      Street: $street, 
      ISO Country Code: $isoCountryCode, 
      Country: $country, 
      Postal code: $postalCode, 
      Administrative area: $administrativeArea, 
      Subadministrative area: $subAdministrativeArea,
      Locality: $locality,
      Sublocality: $subLocality,
      Thoroughfare: $thoroughfare,
      Subthoroughfare: $subThoroughfare
      Latitude: $latitude,
      Longitude: $longitude''';
  }
}
