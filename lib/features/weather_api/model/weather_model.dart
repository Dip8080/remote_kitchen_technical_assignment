class WeatherModel {
  final String? cityName;
  final double? temperature;
  final String? mainCondition;

  WeatherModel({this.cityName, this.temperature, this.mainCondition});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main']
    );
  }
}
