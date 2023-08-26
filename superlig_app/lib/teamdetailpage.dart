import 'package:flutter/material.dart';
import 'package:superlig_app/models/teams.dart';

class TeamDetail extends StatelessWidget {
  const TeamDetail({super.key, required this.teams});

  final Teams teams;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          leading: IconButton(
            color: Colors.white,
            splashColor: Colors.white,
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context); // Önceki sayfaya geri dönme işlemi
            },
          ),
          backgroundColor: Colors.black,
          title: Text(
            teams.teamname,
          ),
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
          centerTitle: false,
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Kadro',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(teams.staff)),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 32,
                      height: MediaQuery.of(context).size.width / 2 - 32,
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            teams.coach,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                teams.coachimage,
                                fit: BoxFit.fill,
                                width: 80,
                                height: 80,
                              )), // Fotoğraf linkini buraya ekleyin
                        ],
                      )),
                ),
                Expanded(
                  child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 32,
                      height: MediaQuery.of(context).size.width / 2 - 32,
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(teams.stadium)),
                ),
              ],
            ),
          ],
        ));
  }
}
