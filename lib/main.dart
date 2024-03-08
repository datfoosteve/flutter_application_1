import 'package:flutter/material.dart';
import 'pages/data_management.dart';
import 'pages/risk_management.dart';
import 'pages/compliance.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Business AI SaaS';
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primaryColor: Colors.indigo[900],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
  title: const Text('Crescere Analytics'),
),
        body: const SingleChildScrollView(
          child: Column(
            children: [
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
                 style: TextStyle(
                   color: Colors.grey[500],
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

class FeatureSection extends StatelessWidget {
  const FeatureSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust the padding as needed
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          FeatureButton(
  color: color,
  icon: Icons.data_usage,
  label: 'Data Management',
  onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DataManagementPage()),
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
                MaterialPageRoute(builder: (context) => const RiskManagementPage()),
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
                MaterialPageRoute(builder: (context) => const CompliancePage()),
              );
            },
          ),
        ],
      ),
    )
    );
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
           color: Colors.blue[500],
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

