import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:superlig_app/pages/pdfwiev.dart';
import 'package:superlig_app/pages/webwiev.dart';
import 'package:superlig_app/provider/app_state.dart';

import 'formspage.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          TextButton(
            onPressed: () {
              var appState = Provider.of<AppState>(context, listen: false);
              appState.logout();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FormsPage(),
                  ),
                  (route) => false);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text("Logout"),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
        child: Consumer<AppState>(builder: (context, appState, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Username: ${appState.username}"),
              const SizedBox(height: 16),
              Text("Email: ${appState.email}"),
              const SizedBox(height: 16),
              Text("Available Users: ${appState.availableUsers.length}"),
              const SizedBox(height: 16),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const PdfViewPage())));
                  },
                  child: const Text("PDF view")),
              const SizedBox(
                height: 16,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const WebViewPage())));
                  },
                  child: const Text("WEB view"))
            ],
          );
        }),
      ),
    );
  }
}
