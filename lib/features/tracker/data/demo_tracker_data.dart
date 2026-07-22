import 'package:flutter/material.dart';

import 'tracker_models.dart';

class DemoTrackerData {
  DemoTrackerData._();

  static const storeName = 'Maa General Store';
  static const storeTagline = 'Simple shop records • 1 July';

  static const homeMetrics = <Metric>[
    Metric(label: "Today's sale", value: '৳6,850', icon: Icons.payments_outlined),
    Metric(
      label: 'Due amount',
      value: '৳1,250',
      icon: Icons.warning_amber_rounded,
      color: Color(0xFFF59E0B),
    ),
    Metric(label: 'Products', value: '42', icon: Icons.inventory_2_outlined),
    Metric(label: 'MFS records', value: '7', icon: Icons.qr_code_2_rounded),
  ];

  static const recentRecords = <RecentRecord>[
    RecentRecord(
      title: 'Sale • Rahim',
      subtitle: 'LED bulb • Cash + due',
      amount: '৳650',
      icon: Icons.receipt_long_outlined,
    ),
    RecentRecord(
      title: 'Sale • Nusrat',
      subtitle: 'Household items',
      amount: '৳250',
      icon: Icons.shopping_bag_outlined,
    ),
    RecentRecord(
      title: 'MFS • Karim',
      subtitle: 'Bkash cash-in',
      amount: '৳2,000',
      icon: Icons.account_balance_wallet_outlined,
    ),
  ];

  static const products = <ProductItem>[
    ProductItem(
      name: 'Miniket rice',
      category: 'Grocery • 50kg',
      quantity: 68,
      unit: 'kg',
      stockValue: '৳5,440',
      supplier: 'Local mill',
    ),
    ProductItem(
      name: 'LED bulb 12W',
      category: 'Electronics • Packet',
      quantity: 22,
      unit: 'pcs',
      stockValue: '৳2,640',
      supplier: 'Rafiq Electric',
    ),
    ProductItem(
      name: 'Paracetamol 500mg',
      category: 'Medicines • Strip',
      quantity: 72,
      unit: 'strips',
      stockValue: '৳2,880',
      supplier: 'City Pharma',
    ),
    ProductItem(
      name: 'Notebook A5',
      category: 'Other • Stationery',
      quantity: 28,
      unit: 'pcs',
      stockValue: '৳1,120',
      supplier: 'Stationery House',
    ),
  ];

  static const dueCustomers = <DueCustomer>[
    DueCustomer(name: 'Rahim Uddin', phone: '01711 345 678', amount: '৳1,250', items: 'LED bulb, medicines'),
    DueCustomer(name: 'Nusrat Jahan', phone: '01822 456 789', amount: '৳950', items: 'Rice, oil'),
    DueCustomer(name: 'Karim Ahmed', phone: '01933 567 890', amount: '৳700', items: 'Household items'),
    DueCustomer(name: 'Sabir Hossain', phone: '01644 678 901', amount: '৳420', items: 'Stationery'),
  ];

  static const mfsTransactions = <MfsTransaction>[
    MfsTransaction(name: 'BKASH721', number: '01722 123 456', amount: '৳2,000', method: 'Cash in'),
    MfsTransaction(name: 'NAGAD210', number: '01844 333 220', amount: '৳1,500', method: 'Cash out'),
    MfsTransaction(name: 'BKASH889', number: '01955 888 101', amount: '৳700', method: 'Cash in'),
    MfsTransaction(name: 'BXTN4221', number: '01731 111 223', amount: '৳3,000', method: 'Cash out'),
  ];
}
