import 'package:flutter_test/flutter_test.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geocoding_platform_interface/geocoding_platform_interface.dart';
import 'package:mockito/mockito.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

final mockAddress = Address(
  administrativeArea: 'Overijssel',
  country: 'Netherlands',
  isoCountryCode: 'NL',
  locality: 'Enschede',
  name: 'Gronausestraat',
  postalCode: '',
  street: 'Gronausestraat 710',
  subAdministrativeArea: 'Enschede',
  subLocality: 'Enschmarke',
  subThoroughfare: '',
  thoroughfare: 'Gronausestraat',
  latitude: 52.2165157,
  longitude: 6.9437819,
);

void main() {
  group('Geocoding', () {
    setUp(() {
      GeocodingPlatform.instance = MockGeocodingPlatform();
    });

    test('locationFromAddress', () async {
      final locations = await locationFromAddress('');
      expect(locations.single, mockAddress);
    });

    test('placemarkFromCoordinates', () async {
      final placemarks = await placemarkFromCoordinates(0, 0);
      expect(placemarks.single, mockAddress);
    });
  });
}

class MockGeocodingPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements GeocodingPlatform {
  Future<List<Address>> locationFromAddress(
    String address, {
    String localeIdentifier,
  }) async {
    return [mockAddress];
  }

  Future<List<Address>> placemarkFromCoordinates(
    double latitude,
    double longitude, {
    String localeIdentifier,
  }) async {
    return [mockAddress];
  }
}
