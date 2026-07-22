import 'package:flutter/material.dart';

enum TrackerTab { home, sale, products, dues, mfs }

class Metric {
  const Metric({
    required this.label,
    required this.value,
    required this.icon,
    this.caption,
    this.color = const Color(0xFF087C4A),
  });

  final String label;
  final String value;
  final IconData icon;
  final String? caption;
  final Color color;
}

class RecentRecord {
  const RecentRecord({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final String amount;
  final IconData icon;
}

class ProductItem {
  const ProductItem({
    required this.name,
    required this.category,
    required this.quantity,
    required this.unit,
    required this.stockValue,
    required this.supplier,
  });

  final String name;
  final String category;
  final int quantity;
  final String unit;
  final String stockValue;
  final String supplier;
}

class DueCustomer {
  const DueCustomer({
    required this.name,
    required this.phone,
    required this.amount,
    required this.items,
  });

  final String name;
  final String phone;
  final String amount;
  final String items;
}

class MfsTransaction {
  const MfsTransaction({
    required this.name,
    required this.number,
    required this.amount,
    required this.method,
  });

  final String name;
  final String number;
  final String amount;
  final String method;
}
