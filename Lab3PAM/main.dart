import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'hospital_controller.dart';

void main() {
  runApp(HospitalApp());
}

class HospitalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hospital Page',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HospitalPage(),
    );
  }
}

class HospitalPage extends StatelessWidget {
  final HospitalController controller = Get.put(HospitalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Page'),
        centerTitle: true,
        backgroundColor: Color(0xFF90CAF9),
      ),
      body: Obx(() {
        return Container(
          color: Colors.lightBlue[50],
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Bara de Căutare
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search doctors or centers',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      controller.updateSearchQuery(value);
                    },
                  ),
                  SizedBox(height: 20),

                  // Secțiunea Categorii
                  Text(
                    'Categorii',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) {
                      final category = controller.categories[index];
                      return CategoryCard(
                        category: category['name'],
                        imageUrl: category['image'],
                      );
                    },
                  ),
                  SizedBox(height: 20),

                  // Secțiunea Doctori cu Show All și Show Less
                  Text(
                    'Doctori',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.displayedDoctors.length,
                    itemBuilder: (context, index) {
                      final doctor = controller.displayedDoctors[index];
                      return DoctorCard(
                        name: doctor['name'],
                        specialty: doctor['specialty'],
                        imageUrl: doctor['imageUrl'],
                        center: doctor['center'],
                        rating: doctor['rating'],
                        reviews: doctor['reviews'],
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: controller.showAllDoctors,
                        child: Text("Show All"),
                      ),
                      TextButton(
                        onPressed: controller.showLessDoctors,
                        child: Text("Show Less"),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Secțiunea Centre Apropiate cu imaginea mărită
                  Text(
                    'Centre Apropiate',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.nearbyCenters.length,
                    itemBuilder: (context, index) {
                      final center = controller.nearbyCenters[index];
                      return CenterCard(
                        name: center['name'],
                        location: center['location'],
                        imageUrl: center['image'],
                        rating: center['rating'],
                        reviews: center['reviews'],
                        largeImage: true, // imagine mare
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

// Card pentru afișarea unei categorii
class CategoryCard extends StatelessWidget {
  final String category;
  final String imageUrl;

  CategoryCard({required this.category, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imageUrl, width: 60, height: 60),
        SizedBox(height: 5),
        Text(category, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}

// Card pentru afișarea unui doctor
class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String imageUrl;
  final String center;
  final String rating;
  final String reviews;

  DoctorCard({
    required this.name,
    required this.specialty,
    required this.imageUrl,
    required this.center,
    required this.rating,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(imageUrl, width: 50, height: 50),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(specialty),
            Text(center),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 4),
                Text('$rating ($reviews)'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Card pentru afișarea unui centru medical apropiat
class CenterCard extends StatelessWidget {
  final String name;
  final String location;
  final String imageUrl;
  final String rating;
  final String reviews;
  final bool largeImage;

  CenterCard({
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.rating,
    required this.reviews,
    this.largeImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(imageUrl, width: largeImage ? 80 : 50, height: largeImage ? 80 : 50),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(location),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 4),
                Text('$rating ($reviews)'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
