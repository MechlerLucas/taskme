import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  String _selectedLanguage = 'Português';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Preferências',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SwitchListTile(
            title: const Text('Notificações'),
            value: _notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
            secondary: const Icon(Icons.notifications),
          ),
          SwitchListTile(
            title: const Text('Modo Escuro'),
            value: _darkModeEnabled,
            onChanged: (bool value) {
              setState(() {
                _darkModeEnabled = value;
              });
            },
            secondary: const Icon(Icons.dark_mode),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Idioma'),
            subtitle: Text(_selectedLanguage),
            onTap: () {
              _showLanguageDialog();
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.restore),
            title: const Text('Restaurar Configurações Padrão'),
            onTap: () {
              _resetSettings();
            },
          ),
        ],
      ),
    );
  }

  // Função para mostrar o diálogo de seleção de idioma
  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Selecione o Idioma'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                RadioListTile<String>(
                  title: const Text('Português'),
                  value: 'Português',
                  groupValue: _selectedLanguage,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedLanguage = value!;
                    });
                    Navigator.of(context).pop();
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Inglês'),
                  value: 'Inglês',
                  groupValue: _selectedLanguage,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedLanguage = value!;
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Função para redefinir as configurações
  void _resetSettings() {
    setState(() {
      _notificationsEnabled = true;
      _darkModeEnabled = false;
      _selectedLanguage = 'Português';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Configurações restauradas para o padrão')),
    );
  }
}
