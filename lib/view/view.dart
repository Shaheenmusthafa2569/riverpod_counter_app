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
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFC2B8FF),

        onPressed: () {
          if (count < 20) {
            ref.read(counterProvider.notifier).state++;
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Cannot increase beyond 20!",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.redAccent,
                duration: const Duration(seconds: 2),
              ),
            );
          }
        },
        child: Icon(Icons.add),
      ),
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
          const Icon(
            Icons.settings,
            color: Color.fromARGB(255, 218, 218, 218),
            size: 28,
          ),
          const Padding(
            padding: EdgeInsets.all(7.0),
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Color.fromARGB(255, 218, 218, 218),
              size: 32,
            ),
          ),
        ],
        backgroundColor: const Color(0xCC100328),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
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
                    style: TextStyle(
                      color: count % 2 == 0 ? Colors.green : Colors.red,
                      fontSize: 26,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Increment / Decrement standard buttons stacked vertically for a cleaner layout
              SizedBox(
                height: 40,
                width: 180,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xCC100328),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (count < 20) {
                      ref.read(counterProvider.notifier).state++;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Cannot increase beyond 20!",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Colors.redAccent,
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "increment",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              if (count > 0) const SizedBox(height: 20),
              if (count > 0)
                SizedBox(
                  height: 40,
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(counterProvider.notifier).state--;
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC2B8FF),
                      foregroundColor: const Color(0xCC100328),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Decrement",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

              if (count > 0) const SizedBox(height: 20),
              if (count > 0)
                SizedBox(
                  height: 40,
                  width: 180,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xCC100328),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      if (count < 20) {
                        ref.read(counterProvider.notifier).state += 5;
                      } else {
                        // Show the snackbar alert when count is already beyond 20
                        ScaffoldMessenger.of(
                          context,
                        ).clearSnackBars(); // Clears any active snackbar immediately
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text(
                              "Cannot increase beyond 20!",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: Colors.redAccent,
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Increment +5",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

              if (count > 0) const SizedBox(height: 20),
              if (count > 0)
                SizedBox(
                  height: 40,
                  width: 180,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC2B8FF),
                      foregroundColor: const Color(0xCC100328),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      ref.read(counterProvider.notifier).state -= 5;
                    },
                    child: const Text(
                      "Decrement -5",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

              const SizedBox(height: 30),
              Text(
                count % 2 == 0 ? "EVEN NUMBER" : "ODD NUMBER",
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
