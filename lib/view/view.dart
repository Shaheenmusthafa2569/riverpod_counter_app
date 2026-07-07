import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_counter_app/counterprovider.dart';

class CountViewpage extends ConsumerWidget {
  const CountViewpage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Count App",
          style: GoogleFonts.arima(
            fontSize: 30,
            color: const Color.fromARGB(255, 218, 218, 218),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(
            Icons.settings,
            color: Color.fromARGB(255, 218, 218, 218),
            size: 28,
          ),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Color.fromARGB(255, 218, 218, 218),
              size: 32,
            ),
          ),
        ],
        backgroundColor: Color(0xCC100328),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF100328), Color(0xFF29011C)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$count",
                    style: TextStyle(color: Colors.white, fontSize: 26),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: 180,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xCC100328),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                  onPressed: () {
                    ref.read(counterProvider.notifier).state++;
                  },
                  child: Text(
                    "increment",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: 180,
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(counterProvider.notifier).state--;
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFC2B8FF),
                    foregroundColor: Color(0xCC100328),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                  child: Text(
                    "Decrement",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: 180,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xCC100328),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                  onPressed: () {
                    ref.read(counterProvider.notifier).state += 5;
                  },
                  child: Text(
                    "Increment +5",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: 180,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFC2B8FF),
                    foregroundColor: Color(0xCC100328),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                  onPressed: () {
                    ref.read(counterProvider.notifier).state -= 5;
                  },
                  child: Text(
                    "Decrement -5",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
