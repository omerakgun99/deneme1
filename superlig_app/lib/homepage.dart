import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:superlig_app/models/teams.dart';
import 'package:superlig_app/teamdetailpage.dart';
import 'package:superlig_app/teamlist.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isGrid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              color: Colors.white,
              splashColor: Colors.white,
              onPressed: () {
                setState(() {
                  isGrid = !isGrid;
                });
              },
              icon: Icon(isGrid ? Icons.view_list : Icons.grid_view)),
          const SizedBox(width: 16),
        ],
        title: const Text(
          "TÜRKİYE SÜPER LİGİ",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: isGrid
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16),
                  itemCount: teamList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  TeamDetail(teams: teamList[index])));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Image.asset(teamList[index].logo,
                                  width: 100, height: 100, fit: BoxFit.fill),
                              const SizedBox(
                                width: 16,
                                height: 16,
                              ),
                              Text(
                                teamList[index].teamname,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ));
                  },
                )
              : ListView.separated(
                  itemCount: teamList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 16,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  TeamDetail(teams: teamList[index])));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white),
                          child: Row(
                            children: [
                              Image.asset(
                                teamList[index].logo,
                                width: 40,
                                height: 40,
                              ),
                              const SizedBox(width: 4),
                              Text(teamList[index].teamname)
                            ],
                          ),
                        ));
                  },
                )),
    );
  }
}
