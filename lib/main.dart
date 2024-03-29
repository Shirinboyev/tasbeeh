import 'package:flutter/material.dart';
import 'package:tasbeeh/calculator.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Tasbeeh(),
  ));
}

class Tasbeeh extends StatefulWidget {
  const Tasbeeh({super.key});

  @override
  State<Tasbeeh> createState() => _MyAppState();
}

class _MyAppState extends State<Tasbeeh> {
  int scale = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 4, 25, 32),
          child: Column(
            children: [
              const SizedBox(height: 30,),
              TextButton(
                style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 27, 223, 33),
            fixedSize: const Size(300, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(70))),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Calculator()));
                },
                child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 76, 149, 175),
                    borderRadius: BorderRadius.circular(200)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Calculator Page", style: TextStyle(color: Colors.black),),
                    ],
                  )),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Center(child: Text('Tasbeeh')),
          backgroundColor: Color.fromARGB(255, 76, 149, 175),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/tasbeeh.png'), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '$scale',
                style: TextStyle(fontSize: 120, color: Colors.white),
              ),
              if (scale < 33 && scale >= 0)
                Text('SubhanAllah',
                    style: TextStyle(fontSize: 30, color: Colors.white)),
              if (scale < 66 && scale >= 33)
                Text('Alhamdulillah',
                    style: TextStyle(fontSize: 30, color: Colors.white)),
              if (scale < 99 && scale >= 66)
                Text('Allohu Akbar',
                    style: TextStyle(fontSize: 30, color: Colors.white)),
              if (scale < 100 && scale >= 99)
                Text("""               La Ilaha Illalohu,
                    Wahdahula Sharika Lahu ,
                    Lahul-Mulku Wa Lahul-Hamdu,
                    Wa Huwa'AlaKulli  Sha'in Qadir
                    """, style: TextStyle(fontSize: 20, color: Colors.white)),
              //if(scale > 100)
              // scale = 1,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(100, 100),
                          backgroundColor: Color(0xFF8179DD)),
                      onPressed: () {
                        setState(() {
                          if (scale != 0) {
                            scale -= 1;
                          }
                        });
                      },
                      child: Text(
                        '—',
                        style: TextStyle(fontSize: 50),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(100, 100),
                          backgroundColor: Colors.green),
                      onPressed: () {
                        setState(() {
                          scale += 1;
                        });
                      },
                      child: Text(
                        '+',
                        style: TextStyle(fontSize: 50),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(100, 100),
                          backgroundColor: Colors.red),
                      onPressed: () {
                        setState(() {
                          scale = 0;
                        });
                      },
                      child: Text('reset', style: TextStyle(fontSize: 25))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
