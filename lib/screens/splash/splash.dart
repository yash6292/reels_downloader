import 'package:flutter/material.dart';
import 'package:reels_downloader/screens/home/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final cnt = Get.put(AdsCnt());
  @override
  void initState() {
    // TODO: implement initState
    // cnt.getAdData();
    // log("${adData.appTitle}", name: 'set');
    super.initState();
     Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height / 8),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(height: 20),
              const Text('Reels Video Downloader',
                  style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 220),
              const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(),
              ),
              const SizedBox(height: 10),
              const Text(
                '   Loading ...',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ]),
      ),
    );
  }
}
