import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider_demo/utils/app_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _appBar(),
      body: _homeBody(),
    ));
  }

  PreferredSizeWidget? _appBar() => AppBar(
        title: Text(AppString.homeAppBar),
        backgroundColor: Colors.blue,
        elevation: 5.0,
      );

  Widget _homeBody() => Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 8,),
              ElevatedButton(onPressed: () {
                Modular.to.navigate(AppString.providerPage);
              }, child: Text(AppString.provider),
                style: ElevatedButton.styleFrom(
                  elevation: 5.0,
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(20),
                  ),
                ),
              ),
          ],
        ),
      );


}
