import 'dart:io';

import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/assets/no-internet.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const Text(
                "No Internet Connection",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "You are not connected to the internet. Make sure Wi-Fi or Mobile Data is on, and try again.",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
               GestureDetector(
                 onTap: (){
                   exit(0);
                 },
                 child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    " exit ",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
              ),
               )
            ],
          ),
        )
    );
  }
}
