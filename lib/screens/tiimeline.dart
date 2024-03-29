import 'package:flutter/material.dart';
import 'package:smartfarm_flutter_app/models/plant_data.dart';
import 'package:smartfarm_flutter_app/widgets/widgets.dart';

class Timeline extends StatelessWidget {
  final int id;
  Timeline({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/bg2.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.6),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          NavBar(),
                          Intro(
                            title: "Day 23",
                            subtitle: plantData[id].name,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      padding: EdgeInsets.all(20),
                      child: Hero(
                        tag: plantData[id].name,
                        child: Image.asset(plantData[id].imageAsset),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(30),
                      child: Text(
                        "Growing Plan",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontFamily: "Saudagar"),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}