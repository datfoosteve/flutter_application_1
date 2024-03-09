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
      home: Navigator(
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(builder: (_) => const MyHomePage());
            case '/about':
              return MaterialPageRoute(builder: (_) => const AboutUsPage());
            case '/services':
              return MaterialPageRoute(builder: (_) => const ServicesPage());
            case '/insights':
              return MaterialPageRoute(builder: (_) => const InsightsPage());
            case '/contact':
              return MaterialPageRoute(builder: (_) => const ContactUsPage());
            default:
              return MaterialPageRoute(builder: (_) => const MyHomePage());
          }
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'images/logo.png',
              height: 40,
            ),
            const SizedBox(width: 10),
            const Text('Crescere Analytics'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: const Text('Home'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
            child: const Text('About Us'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/services');
            },
            child: const Text('Services'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/insights');
            },
            child: const Text('Insights'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/contact');
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
            SizedBox(height: 60),
            Footer(),
          ],
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
          const FavoriteWidget(),
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
    return Stack(
      children: [
        Container(
          height: 400,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/hero_background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Empowering Your Data, Transforming Your Future',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Crescere Analytics: Your Trusted Partner in AI-Driven Analytics',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the desired page or perform an action
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FeatureSection extends StatelessWidget {
  const FeatureSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
      ),
    );
  }
}

class FeatureButton extends StatelessWidget {
  const FeatureButton({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final Color color;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: color,
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
        style: const TextStyle(fontSize: 16),
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

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Our Mission',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'At Crescere Analytics, our mission is to empower businesses with intelligent analytics solutions that drive growth, mitigate risks, and ensure compliance. We strive to be the trusted partner for organizations seeking to harness the full potential of their data.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Our Values',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '- Innovation: We constantly push the boundaries of analytics and AI to deliver cutting-edge solutions.\n- Integrity: We maintain the highest standards of ethics and transparency in all our dealings.\n- Collaboration: We work closely with our clients to understand their unique needs and deliver tailored solutions.\n- Excellence: We strive for excellence in everything we do, from our technology to our customer service.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Services'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Our Services',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ServiceCard(
              title: 'Data Management',
              description:
                  'We help businesses streamline their data management processes, ensuring data quality, security, and accessibility.',
            ),
            SizedBox(height: 10),
            ServiceCard(
              title: 'Risk Management',
              description:
                  'Our AI-powered risk management solutions enable businesses to identify, assess, and mitigate risks in real-time.',
            ),
            SizedBox(height: 10),
            ServiceCard(
              title: 'Compliance',
              description:
                  'We assist organizations in maintaining compliance with industry regulations and standards through intelligent analytics.',
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;

  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class InsightsPage extends StatelessWidget {
  const InsightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insights'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Latest Insights',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const InsightCard(
              title: 'The Future of Analytics: Trends to Watch',
              description:
                  'Discover the latest trends shaping the future of analytics and how businesses can stay ahead of the curve.',
            ),
            const SizedBox(height: 10),
            const InsightCard(
              title: 'Leveraging AI for Smarter Decision Making',
              description:
                  'Learn how AI is transforming decision-making processes and enabling businesses to make data-driven choices.',
            ),
            const SizedBox(height: 10),
            const InsightCard(
              title: 'Navigating Data Privacy and Security Challenges',
              description:
                  'Explore best practices for safeguarding data privacy and security in the age of big data and AI.',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the blog or insights listing page
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const BlogPage()),
                // );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'View All Insights',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InsightCard extends StatelessWidget {
  final String title;
  final String description;

  const InsightCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Get in Touch',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Message',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle form submission
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const ContactInfoItem(
              icon: Icons.location_on,
              text: '123 Analytics Street, City, Country',
            ),
            const SizedBox(height: 5),
            const ContactInfoItem(
              icon: Icons.phone,
              text: '+1 123-456-7890',
            ),
            const SizedBox(height: 5),
            const ContactInfoItem(
              icon: Icons.email,
              text: 'info@crescereanalytics.com',
            ),
          ],
        ),
      ),
    );
  }
}

class ContactInfoItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactInfoItem({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).primaryColor,
          size: 20,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ],
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

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Crescere Analytics',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Address: 123 Analytics Street, City, Country',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 5),
          Text(
            'Phone: +1 123-456-7890',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 5),
          Text(
            'Email: info@crescereanalytics.com',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FooterLink(
                icon: Icons.home,
                text: 'Home',
                route: '/',
              ),
              SizedBox(width: 20),
              FooterLink(
                icon: Icons.info,
                text: 'About Us',
                route: '/about',
              ),
              SizedBox(width: 20),
              FooterLink(
                icon: Icons.work,
                text: 'Services',
                route: '/services',
              ),
              SizedBox(width: 20),
              FooterLink(
                icon: Icons.insights,
                text: 'Insights',
                route: '/insights',
              ),
              SizedBox(width: 20),
              FooterLink(
                icon: Icons.contact_mail,
                text: 'Contact Us',
                route: '/contact',
              ),
            ],
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              '© 2023 Crescere Analytics. All rights reserved.',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class FooterLink extends StatelessWidget {
  final IconData icon;
  final String text;
  final String route;

  const FooterLink({
    super.key,
    required this.icon,
    required this.text,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the corresponding route
        Navigator.pushNamed(context, route);
      },
      child: Column(
        children: [
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: 24,
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
