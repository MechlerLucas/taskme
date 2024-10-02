import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  // Função para abrir o link do GitHub no navegador
  void _launchURL(String url) async {
    Uri uri = Uri.parse(url); // Convertendo a string do URL para um objeto Uri
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Não foi possível abrir o link $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center( // Centraliza todo o conteúdo
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Taskme',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Criadores:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildCreatorCard(
                imageUrl: 'https://avatars.githubusercontent.com/u/28672548?v=4',
                name: 'Lucas Mechler Fernandes',
                githubUrl: 'https://github.com/MechlerLucas',
              ),
              const SizedBox(height: 16),
              _buildCreatorCard(
                imageUrl: 'https://avatars.githubusercontent.com/u/65903314?v=4',
                name: 'Lucas Grazia',
                githubUrl: 'https://github.com/LucasD361',
              ),
              const SizedBox(height: 16),
              _buildCreatorCard(
                imageUrl: 'https://avatars.githubusercontent.com/u/58276280?v=4',
                name: 'Fernando Oliveira Soares',
                githubUrl: 'https://github.com/fsoaresmg',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCreatorCard({
    required String imageUrl,
    required String name,
    required String githubUrl,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(imageUrl),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.link, size: 24),
            const SizedBox(width: 8),
            InkWell(
              onTap: () => _launchURL(githubUrl),
              child: Text(
                githubUrl,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
