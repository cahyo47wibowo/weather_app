# weather_app

Weather Flutter with BloC Pattern + WeatherMap API

https://github.com/cahyo47wibowo/weather_app/blob/master/Screen%20Shot%202020-09-11%20at%2014.33.57.png?raw=true

In this Project, we implement Reactive Programming using RxDart.
RxDart is based on Streams and Sinks. 

Streams represent the flux of data and events, with Stream you can listen to data and event changes,

-Widgets send events to the BLoC via Sinks,
-Widgets are notified by the BLoC via streams,
-the business logic which is implemented by the BLoC is none of their concern.

Created by Google, the BLoC (Business Logic Component) stands as a middleman between a source of data in your app (e.g an API response) and widgets that need the data. Its scope is to take handle the business logic code separately from the UI. In the image below you can see the data flux using BLoC pattern.


The multiple widgets from the app send data to the BLoC class through Sinks and they get notified when data is changed by Streams. There’s no business logic in the widget, which means that whatever happens in BLoC is not the concern of the UI. A concrete example will be shown below.










## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
