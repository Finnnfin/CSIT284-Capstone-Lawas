
import 'package:flutter/material.dart';
import '../models/found_item.dart';
import '../utils/app_theme.dart';

class ItemDetailsScreen extends StatelessWidget {
  final FoundItem item;

  const ItemDetailsScreen({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Item Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: item.imageUrl.trim().isNotEmpty
                  ? Image.network(
                      item.imageUrl,
                      width: double.infinity,
                      height: 220,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }

                        return Container(
                          width: double.infinity,
                          height: 220,
                          color: Colors.grey.shade200,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return _imagePlaceholder();
                      },
                    )
                  : _imagePlaceholder(),
            ),

            const SizedBox(height: 20),

            // Item Name
            Text(
              item.name,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDark,
              ),
            ),

            const SizedBox(height: 12),

            // Item Status
            Chip(
              label: Text(item.status),
              backgroundColor: item.status == 'FOUND'
                  ? Colors.green.shade100
                  : Colors.orange.shade100,
            ),

            const SizedBox(height: 12),

            // Item Location
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: AppTheme.primaryGreen,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(item.location),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Item Date
            Row(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  color: AppTheme.primaryGreen,
                ),
                const SizedBox(width: 8),
                Text(
                  '${item.date.day}/${item.date.month}/${item.date.year}',
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Description Heading
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDark,
              ),
            ),

            const SizedBox(height: 8),

            // Item Description
            Text(
              item.description,
              style: const TextStyle(
                fontSize: 15,
                height: 1.5,
                color: AppTheme.textDark,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Image Placeholder
  Widget _imagePlaceholder() {
    return Container(
      width: double.infinity,
      height: 220,
      color: Colors.grey.shade200,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image_outlined,
            size: 60,
            color: Colors.grey,
          ),
          SizedBox(height: 8),
          Text(
            'No image available',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
