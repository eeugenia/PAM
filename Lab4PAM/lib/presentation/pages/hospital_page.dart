import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laborator4/presentation/controller/hospital_controller.dart';
import 'package:laborator4/presentation/widgets/category_card.dart';
import 'package:laborator4/presentation/widgets/doctor_card.dart';
import 'package:laborator4/presentation/widgets/center_card.dart';

import '../../domain/usecases/get_categories.dart';
import '../../domain/usecases/get_doctors.dart';
import '../../domain/usecases/get_nearby_centers.dart';

class HospitalPage extends StatelessWidget {
  final HospitalController controller = Get.put(HospitalController(
    getCategoriesUseCase: GetCategories(Get.find()),
    getDoctorsUseCase: GetDoctors(Get.find()),
    getNearbyCentersUseCase: GetNearbyCenters(Get.find()),
  ));

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
                    onChanged: controller.updateSearchQuery,
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
                        category: category.name,
                        imageUrl: category.image,
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
                        name: doctor.name,
                        specialty: doctor.specialty,
                        imageUrl: doctor.imageUrl,
                        center: doctor.center,
                        rating: doctor.rating,
                        reviews: doctor.reviews,
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
                        name: center.name,
                        location: center.location,
                        imageUrl: center.imageUrl,
                        rating: center.rating,
                        reviews: center.reviews,
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
