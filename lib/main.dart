import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:fruits_application/home_page.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  runApp(
   DevicePreview(
    enabled: true,
    builder: (context) => MyApp()
   ),
    );
}

class MyApp extends StatefulWidget {
  

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
         useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),

         title: "fruit app",
      theme: ThemeData(
        primaryColor: Colors.blue[900],
      ),
      home: HomePage(),
      
    );
  }
}