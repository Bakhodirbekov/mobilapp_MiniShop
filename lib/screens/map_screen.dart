import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/colors.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'Find Our Stores',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Map Container
            Container(
              height: 250,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    // Placeholder for map - in real app use google_maps_flutter
                    Container(
                      color: Colors.grey.shade300,
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.map,
                              size: 60,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Map View',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      right: 16,
                      child: FloatingActionButton.small(
                        onPressed: () => _openGoogleMaps(),
                        backgroundColor: Colors.white,
                        child: const Icon(
                          Icons.directions,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Store Locations
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Our Store Locations',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildStoreCard(
                    name: 'Downtown Store',
                    address: '123 Main Street, New York, NY',
                    hours: 'Open: 9:00 AM - 9:00 PM',
                    phone: '+1-555-0123',
                  ),
                  const SizedBox(height: 12),
                  _buildStoreCard(
                    name: 'Mall Location',
                    address: '456 Shopping Ave, Los Angeles, CA',
                    hours: 'Open: 10:00 AM - 10:00 PM',
                    phone: '+1-555-0124',
                  ),
                  const SizedBox(height: 12),
                  _buildStoreCard(
                    name: 'Suburban Store',
                    address: '789 Park Road, Chicago, IL',
                    hours: 'Open: 8:00 AM - 8:00 PM',
                    phone: '+1-555-0125',
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoreCard({
    required String name,
    required String address,
    required String hours,
    required String phone,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.pastelGreen,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.store,
              color: AppColors.primary,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  address,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  hours,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () => _callStore(phone),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        color: AppColors.primary,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Call Store',
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openGoogleMaps() async {
    // Tashkent coordinates
    final url = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=41.31521787131059,69.28810767559462');

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  void _callStore(String phone) async {
    final url = Uri.parse('tel:$phone');

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}