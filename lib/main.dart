import 'package:flutter/material.dart';
import 'pages/data_management.dart';
import 'pages/risk_management.dart';
import 'pages/compliance.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Crescere Analytics';
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primaryColor: Colors.indigo[900],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'images/logo.png',
                height: 40,
              ),
              const SizedBox(width: 10),
              const Text(appTitle),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Navigate to Home page
              },
              child: const Text('Home'),
            ),
            TextButton(
              onPressed: () {
                // Navigate to About Us page
              },
              child: const Text('About Us'),
            ),
            TextButton(
              onPressed: () {
                // Navigate to Services page
              },
              child: const Text('Services'),
            ),
            TextButton(
              onPressed: () {
                // Navigate to Insights page
              },
              child: const Text('Insights'),
            ),
            TextButton(
              onPressed: () {
                // Navigate to Contact Us page
              },
              child: const Text('Contact Us'),
            ),
          ],
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              HeroSection(),
              IntroSection(),
              ImageSection(
                image: 'images/ai_audit.jpg',
              ),
              TitleSection(
                name: 'Crescere Analytics',
                location: 'Reimagining the Future of Audit',
              ),
              FeatureSection(),
              TextSection(
                description:
                    'Crescere Analytics is revolutionizing the audit industry by leveraging the power of artificial intelligence. Our cutting-edge solutions address the multifaceted challenges faced by the audit function, including data management, technology adoption, risk management, fraud detection, and regulatory compliance.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  location,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 246, 245, 245),
                  ),
                ),
              ],
            ),
          ),
          const FavoriteWidget(), // Removed the star icon and replaced with FavoriteWidget
        ],
      ),
    );
  }
}

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Crescere Analytics',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Crescere Analytics is a leading provider of AI-driven analytics solutions. With our expertise in data management, risk management, and compliance, we help businesses unlock the full potential of their data. Our cutting-edge technologies and advanced algorithms empower organizations to make data-driven decisions, optimize operations, and achieve sustainable growth.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/hero_background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Empowering Your Data, Transforming Your Future',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Crescere Analytics: Your Trusted Partner in AI-Driven Analytics',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureSection extends StatelessWidget {
  const FeatureSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0), // Adjust the padding as needed
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FeatureButton(
                color: color,
                icon: Icons.data_usage_outlined,
                label: 'Data Management',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DataManagementPage()),
                  );
                },
              ),
              FeatureButton(
                color: color,
                icon: Icons.security,
                label: 'Risk Management',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RiskManagementPage()),
                  );
                },
              ),
              FeatureButton(
                color: color,
                icon: Icons.gavel,
                label: 'Compliance',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CompliancePage()),
                  );
                },
              ),
            ],
          ),
        ));
  }
}

class FeatureButton extends StatelessWidget {
  const FeatureButton({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
    required this.onTap, // Added onTap parameter
  });

  final Color color;
  final IconData icon;
  final String label;
  final VoidCallback onTap; // Added onTap parameter

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Use the onTap parameter in GestureDetector
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fitWidth,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.dstIn,
          ),
        ),
      ),
      child: const SizedBox(
        width: double.infinity,
        height: 300,
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? const Icon(Icons.bookmark)
                : const Icon(Icons.bookmark_border)),
            color: const Color.fromARGB(255, 141, 141, 141),
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}
