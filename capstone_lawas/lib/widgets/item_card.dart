
import 'package:flutter/material.dart';
import '../models/found_item.dart';
import '../utils/app_theme.dart';

class ItemCard extends StatelessWidget {
  final FoundItem item;
  final VoidCallback onTap;

  const ItemCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.cardWhite,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: const CircleAvatar(
          backgroundColor: Color(0xFFE4EDE8),
          child: Icon(
            Icons.inventory_2_outlined,
            color: AppTheme.primaryGreen,
          ),
        ),
        title: Text(
          item.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppTheme.textDark,
          ),
        ),
        subtitle: Text(
          '${item.location}\n${item.status}',
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
