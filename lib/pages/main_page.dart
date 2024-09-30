import 'package:application/pages/card_page.dart';
import 'package:application/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';


// Tela base, aqui, quaisquer modificações feitas afetarão todas as telas.

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Tarefas Diárias'),
        leading: IconButton(
            icon: const Icon(Icons.menu),
            //Ação para menu de appBar
            onPressed: () {},
          ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        //A ordem que os itens ficam nessa lista, é a ordem que elas são referenciadas na barra de navegação inferior
        children: const [
          CardPage(),
          LoginPage(),
          SignUpScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
