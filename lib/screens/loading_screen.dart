import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

void getLocationData() async{
  WeatherModel weatherModel = WeatherModel();
  var weatherData = await weatherModel.getLocationWeather();
  Navigator.push(context, MaterialPageRoute(builder: (context){
  return LocationScreen(weatherData:weatherData,);}));
}

@override
  void initState()  {
     super.initState();
     getLocationData();
  }

  @override
  Widget build(BuildContext context)  {
    return const  Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
      // body: Center(child:  Text(getLocation().toString())),
    );
  }
}
