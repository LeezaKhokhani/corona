import 'dart:convert';
import 'package:http/http.dart' as http;
import '../globals/globals.dart';
import '../moduls/country_data.dart';

class CountryAPIHelper {
  CountryAPIHelper._();

  static final CountryAPIHelper userAPIHelper = CountryAPIHelper._();

  Future<List<CountryData>?> fetchingUserData() async {
    http.Response response =
    await http.get(Uri.parse("https://covid-api.mmediagroup.fr/v1/cases/"));

    if (response.statusCode == 200) {
      Map decodedData = jsonDecode(response.body);

      List<CountryData> allCountryData = [];

      List.generate(countryAll.length, (index) {
        print(index);
        return allCountryData.add(
            CountryData.fromMap(e: decodedData, keyname: countryAll[index]));
      });

      print(allCountryData);

      return allCountryData;
    }
    return null;
  }
}