import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/model/coord_model.dart';
import 'package:weather_app/model/main_model.dart';
import 'package:weather_app/model/sys_model.dart';
import 'package:weather_app/model/weather_response_model.dart';
import 'package:weather_app/model/wind_model.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    weatherBloc.fetchLondonWeather();
    return StreamBuilder(
        stream: weatherBloc.weather,
        builder: (context, AsyncSnapshot<WeatherResponse> snapshot) {
          if (snapshot.hasData) {
            return _buildWeatherScreen(snapshot.data);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Container _buildWeatherScreen(WeatherResponse data) {
    return Container (
      padding:  const EdgeInsets.all(17.0),
      child: Column (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildTitle(data.name),
          _buildCoord(data.coord),
          _buildMain(data.mainModel),
          _buildWindInfo(data.wind),
          _buildSys(data.sys),
        ],
      ),
    );
  }

  Center _buildTitle(String name) {
    return Center (
      child: Text(
        "Weather in " + name,
        style:
        TextStyle(color: Color.fromRGBO(0, 123, 174, 100), fontSize: 40.0),
        textAlign : TextAlign.center,
      ),
    );
  }

  Column _buildCoord(Coord coord) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            "Coord",
            style: TextStyle(
              color: Color.fromRGBO(0, 123, 174, 100), fontSize: 18.0),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Lat:  " + coord.lat.toString()),
            _buildVerticalDivider(),
            Text("Long: " + coord.lon.toString())
          ],
        )
      ],
    );
  }

  Column _buildMain(MainModel mainModel){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            "Main", style: TextStyle(color: Color.fromRGBO(0, 123, 174, 100), fontSize: 18.0),
          ),
        ),
        Text("Temperature: "+ mainModel.temp.toString()),
        Text("Pressure: "+mainModel.pressure.toString()),
        Text("Humidity: "+mainModel.humidity.toString()),
        Text("Higest Temperature: "+mainModel.tempMax.toString()),
        Text("Lowest Temperature: "+mainModel.tempMin.toString()),
      ],
    );
  }

  Column _buildWindInfo(Wind wind){
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            "Wind", style: TextStyle(color: Color.fromRGBO(0, 123, 174, 100),fontSize: 18.0),),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Speed: " + wind.speed.toString()),
            _buildVerticalDivider(),
            Text("Degree: "+wind.deg.toString()),
          ],
        )
      ],
    );
  }

  Column _buildSys(Sys sys){
    final dateFormat = new DateFormat('hh:mm:ss');
    var sunRiseDate = new DateTime.fromMillisecondsSinceEpoch(sys.sunrise *1000);
    var sunSetDate = new DateTime.fromMillisecondsSinceEpoch(sys.sunset * 1000);
    return Column (
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            "Sys",
            style: TextStyle(color: Color.fromRGBO(0, 123, 174, 100),fontSize: 18.0),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Sunrise: " + dateFormat.format(sunRiseDate)),
            _buildVerticalDivider(),
            Text("Sunset: " + dateFormat.format(sunSetDate) )
          ],
        )
      ],
    );
  }

  Container _buildVerticalDivider(){
    return Container(
      height: 20, child: VerticalDivider(color: Colors.blueGrey),
    );
  }
}
