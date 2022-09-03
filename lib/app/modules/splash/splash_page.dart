import 'package:flutter_modular/flutter_modular.dart';
import 'package:wakke_fun/app/modules/splash/splash_store.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  final _store = Modular.get<SplashStore>();

  @override
  void initState() {
    _store.goPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Center(
            child: Image.asset(
              'assets/images/logo_wakke_branco800.png',
              scale: 4,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              bottom: 20,
            ),
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
