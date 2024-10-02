import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Function(int) onSelectScreen; // Função que altera a tela
  const CustomDrawer({super.key, required this.onSelectScreen});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Início'),
            onTap: () {
              onSelectScreen(0); // Altera para CardPage
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () {
              onSelectScreen(1); // Altera para LoginPage
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Sobre'),
            onTap: () {
              onSelectScreen(2); // Altera para AboutPage
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              onSelectScreen(3); // Altera para Logout
            },
          ),
        ],
      ),
    );
  }
}
