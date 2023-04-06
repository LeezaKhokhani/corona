class CountryData {
  final dynamic country;
  final dynamic infected;
  final dynamic death;
  final dynamic recovered;
  final dynamic population;

  CountryData(
      {required this.country,
        required this.infected,
        required this.death,
        required this.recovered,
        required this.population});

  factory CountryData.fromMap({required Map e, required String keyname}) {
    return CountryData(
        country: e[keyname]["All"]["country"],
        infected: e[keyname]["All"]["confirmed"],
        death: e[keyname]["All"]["deaths"],
        recovered: e[keyname]["All"]["recovered"],
        population: e[keyname]["All"]["population"]);
  }
}