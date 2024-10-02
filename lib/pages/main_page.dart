import 'package:flutter/material.dart';

import 'card_page.dart';
import 'settings_page.dart';
import 'about.dart';
import 'login_page.dart';
import '/popup_menus/drawer.dart';

// Tela base, aqui, quaisquer modificações feitas afetarão todas as telas.

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {

  int _currentIndex = 0;

  // Lista com os títulos das telas
  final List<String> _titles = [
    'Página Inicial', // Para CardPage
    'Configurações',  // Para LoginPage
    'About Taskme',   // About
    'Login',          // Para SignUpScreen
  ];

  // ALTERAR para usar push, e poder voltar de quaisquer telas
  // Função para alterar o índice de tela
  void _onSelectScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
    Navigator.pop(context); // Fecha o Drawer após a seleção
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text(_titles[_currentIndex]), // Título dinâmico com base na tela
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Abre o Drawer ao clicar no botão de menu
              },
            );
          },
        ),
      ),
      drawer: CustomDrawer(
        onSelectScreen: _onSelectScreen, // Passa a função de mudança de tela para o Drawer
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          CardPage(),
          SettingsPage(),
          AboutPage(),
          LoginPage(),
        ],
      ),
    );
  }
}
