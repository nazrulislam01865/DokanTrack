import 'package:flutter/material.dart';

import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/tracker_ui.dart';
import '../data/demo_tracker_data.dart';
import '../data/tracker_models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TrackerPage(
      activeTab: TrackerTab.home,
      child: TrackerScrollView(
        children: [
          ScreenHeader(
            title: DemoTrackerData.storeName,
            subtitle: DemoTrackerData.storeTagline,
            trailing: RoundIconButton(
              icon: Icons.settings_outlined,
              onPressed: () => Navigator.pushNamed(context, AppRoutes.settings),
            ),
          ),
          const Gap(16),
          StatBanner(
            label: "Today's total sale",
            value: '৳6,850',
            caption: '16 sales entries • 12% up from yesterday',
            icon: Icons.receipt_long_rounded,
          ),
          const Gap(12),
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.72,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [for (final metric in DemoTrackerData.homeMetrics.skip(1)) MetricTile(metric: metric)],
          ),
          const Gap(14),
          const SectionHeader(title: 'Add a record'),
          const Gap(8),
          Row(
            children: [
              Expanded(
                child: SecondaryActionButton(
                  label: 'New sale',
                  icon: Icons.add_rounded,
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.newSale),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: SecondaryActionButton(
                  label: 'Add product',
                  icon: Icons.inventory_2_outlined,
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.addProduct),
                ),
              ),
            ],
          ),
          const Gap(8),
          Row(
            children: [
              Expanded(
                child: SecondaryActionButton(
                  label: 'Add MFS',
                  icon: Icons.account_balance_wallet_outlined,
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.newMfs),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: SecondaryActionButton(
                  label: 'Collect due',
                  icon: Icons.payments_outlined,
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.collectDue),
                ),
              ),
            ],
          ),
          const Gap(14),
          SectionHeader(
            title: 'Recent records',
            actionLabel: 'View all',
            onAction: () => Navigator.pushNamed(context, AppRoutes.salesHistory),
          ),
          const Gap(8),
          for (final record in DemoTrackerData.recentRecords) ...[
            RecordTile(
              title: record.title,
              subtitle: record.subtitle,
              trailing: record.amount,
              icon: record.icon,
            ),
            const Gap(8),
          ],
        ],
      ),
    );
  }
}

class NewSaleScreen extends StatelessWidget {
  const NewSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TrackerPage(
      activeTab: TrackerTab.sale,
      child: TrackerScrollView(
        children: [
          ScreenHeader(title: 'New sale', subtitle: 'Sell any product using the same basic fields'),
          const Gap(14),
          const FormInput(label: 'Product sold', value: 'LED bulb 12W', icon: Icons.inventory_2_outlined),
          const Gap(10),
          const FormInput(label: 'Quantity sold', value: '2 pcs', icon: Icons.format_list_numbered_rounded),
          const Gap(10),
          const FormInput(label: 'Price per unit', value: '৳180', icon: Icons.sell_outlined),
          const Gap(10),
          const FormInput(label: 'Total sale amount', value: '৳360', icon: Icons.payments_outlined),
          const Gap(10),
          const FormInput(label: 'Buyer name', value: 'Rahim Uddin', icon: Icons.person_outline_rounded),
          const Gap(10),
          const FormInput(label: 'Buyer mobile', value: '01712 345 678', icon: Icons.phone_outlined),
          const Gap(14),
          const Text('Payment status', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900)),
          const Gap(8),
          const ChoicePills(items: ['Fully paid', 'Not fully paid'], selectedIndex: 1),
          const Gap(10),
          const FormInput(label: 'Amount paid now', value: '৳100', icon: Icons.account_balance_wallet_outlined),
          const Gap(12),
          const InfoBox(
            title: 'Due amount: ৳260',
            message: 'Because this sale is not fully paid, Rahim’s name, number, and due will appear in Due Customers.',
            color: AppColors.softAmber,
          ),
          const Gap(18),
          PrimaryActionButton(
            label: 'Save sale',
            onPressed: () => Navigator.pushNamed(context, AppRoutes.saleSaved),
          ),
        ],
      ),
    );
  }
}

class SaleSavedScreen extends StatelessWidget {
  const SaleSavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TrackerPage(
      activeTab: TrackerTab.sale,
      child: TrackerScrollView(
        children: [
          ScreenHeader(title: 'Sale saved', subtitle: 'Record no. ORD-57 • 4:48 PM'),
          const Gap(14),
          const StatBanner(label: 'Total sale', value: '৳360', caption: 'Balance linked to Rahim Uddin', icon: Icons.check_rounded),
          const Gap(12),
          const InfoBox(
            title: 'Buyer information',
            message: 'Rahim Uddin • 01712 345 678',
            color: AppColors.softBlue,
          ),
          const Gap(12),
          _PlainPanel(
            title: 'Sold item',
            children: const [
              _AmountLine(label: 'LED bulb 12W', value: '৳360'),
              _AmountLine(label: '2 pcs × ৳180', value: ''),
              Divider(height: 18),
              _AmountLine(label: 'Total sale', value: '৳360'),
              _AmountLine(label: 'Amount paid', value: '৳100'),
              _AmountLine(label: 'Due', value: '৳260', strong: true),
            ],
          ),
          const Gap(12),
          const InfoBox(
            title: 'Added to Due list',
            message: 'Rahim’s remaining ৳260 is now visible with his name and mobile number.',
            color: AppColors.softAmber,
          ),
          const Gap(14),
          const SectionHeader(title: 'Next action'),
          const Gap(8),
          Row(
            children: [
              Expanded(child: SecondaryActionButton(label: 'New sale', icon: Icons.add_rounded, onPressed: () => Navigator.pushNamed(context, AppRoutes.newSale))),
              const SizedBox(width: 8),
              Expanded(child: SecondaryActionButton(label: 'Share', icon: Icons.ios_share_rounded, onPressed: () {})),
              const SizedBox(width: 8),
              Expanded(child: SecondaryActionButton(label: 'Collect due', icon: Icons.payments_outlined, onPressed: () => Navigator.pushNamed(context, AppRoutes.collectDue))),
            ],
          ),
          const Gap(12),
          PrimaryActionButton(
            label: 'Done',
            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (_) => false),
          ),
        ],
      ),
    );
  }
}

class SalesHistoryScreen extends StatelessWidget {
  const SalesHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TrackerPage(
      activeTab: TrackerTab.home,
      child: TrackerScrollView(
        children: [
          ScreenHeader(title: 'Sales history', subtitle: 'Every saved sale in one list'),
          const Gap(14),
          const StatBanner(label: 'July sale records', value: '286 entries', caption: 'Total sale amount: ৳84,500 • Due: ৳6,300'),
          const Gap(12),
          const SearchBarField(hint: 'Search buyer name or mobile number'),
          const Gap(10),
          const ChoicePills(items: ['All', 'Fully paid', 'Not fully paid'], selectedIndex: 0),
          const Gap(12),
          const Text('18 July 2026', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900)),
          const Gap(8),
          RecordTile(title: 'Rahim Uddin', subtitle: 'LED bulb • Cash + due', trailing: '৳360', icon: Icons.person_outline_rounded, onTap: () => Navigator.pushNamed(context, AppRoutes.dueDetail)),
          const Gap(8),
          const RecordTile(title: 'Cash buyer', subtitle: 'Miniket rice • Fully paid', trailing: '৳985', icon: Icons.person_outline_rounded),
          const Gap(8),
          const RecordTile(title: 'Nusrat Jahan', subtitle: 'Household savings • Not fully paid', trailing: '৳380', icon: Icons.person_outline_rounded),
          const Gap(8),
          const RecordTile(title: 'Karim Ahmed', subtitle: 'Notebook A5 • Cash + due', trailing: '৳200', icon: Icons.person_outline_rounded),
          const Gap(16),
          PrimaryActionButton(label: 'Add another sale', icon: Icons.add_rounded, onPressed: () => Navigator.pushNamed(context, AppRoutes.newSale)),
        ],
      ),
    );
  }
}

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TrackerPage(
      activeTab: TrackerTab.products,
      child: TrackerScrollView(
        children: [
          ScreenHeader(title: 'Products', subtitle: 'Track products across every shop category'),
          const Gap(14),
          const StatBanner(label: 'Product total', value: '42 products', caption: 'Grocery • Electronics • Medicines • Other'),
          const Gap(12),
          const SearchBarField(hint: 'Name, category or item code'),
          const Gap(10),
          const ChoicePills(items: ['All', 'Grocery', 'Medicines', 'Other'], selectedIndex: 0),
          const Gap(12),
          const SectionHeader(title: 'Products across categories'),
          const Gap(8),
          for (final product in DemoTrackerData.products) ...[
            RecordTile(
              title: product.name,
              subtitle: product.category,
              trailing: '${product.quantity} ${product.unit}',
              icon: Icons.inventory_2_outlined,
              onTap: () => Navigator.pushNamed(context, AppRoutes.productDetail),
            ),
            const Gap(8),
          ],
          const Gap(12),
          PrimaryActionButton(
            label: 'Add product or stock entry',
            icon: Icons.add_rounded,
            onPressed: () => Navigator.pushNamed(context, AppRoutes.addProduct),
          ),
        ],
      ),
    );
  }
}

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TrackerPage(
      activeTab: TrackerTab.products,
      child: TrackerScrollView(
        children: [
          ScreenHeader(title: 'Add new product', subtitle: 'Create a product for any type of shop'),
          const Gap(14),
          const FormInput(label: 'Product name', value: 'Paracetamol 500mg', icon: Icons.inventory_2_outlined),
          const Gap(10),
          const Text('Product category', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900)),
          const Gap(8),
          const ChoicePills(items: ['Grocery', 'Electronics', 'Medicines', 'Other'], selectedIndex: 2),
          const Gap(10),
          const FormInput(label: 'Supplier', value: 'Bashir, empty if manufacturer', icon: Icons.local_shipping_outlined),
          const Gap(10),
          const Text('Unit type', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900)),
          const Gap(8),
          const ChoicePills(items: ['kg', 'piece', 'strip'], selectedIndex: 2),
          const Gap(10),
          const FormInput(label: 'Opening quantity', value: '20 strips', icon: Icons.add_box_outlined),
          const Gap(10),
          const FormInput(label: 'Total amount paid for opening quantity', value: '৳1,300', icon: Icons.payments_outlined),
          const Gap(10),
          const FormInput(label: 'Default selling price per unit', value: '৳70 per strip', icon: Icons.sell_outlined),
          const Gap(10),
          const FormInput(label: 'Low quantity warning', value: 'Alert below 10 strips • Optional', icon: Icons.notifications_active_outlined),
          const Gap(12),
          const InfoBox(
            title: 'Flexible product record',
            message: 'All products use the same simple fields. Extra details appear only for the selected category.',
          ),
          const Gap(18),
          PrimaryActionButton(label: 'Save new product', onPressed: () => Navigator.pushNamed(context, AppRoutes.products)),
        ],
      ),
    );
  }
}

class AddStockEntryScreen extends StatelessWidget {
  const AddStockEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TrackerPage(
      activeTab: TrackerTab.products,
      child: TrackerScrollView(
        children: [
          ScreenHeader(title: 'Add product stock', subtitle: 'Record quantity and amount paid'),
          const Gap(14),
          const FormInput(label: 'Product name', value: 'Paracetamol 500mg', icon: Icons.inventory_2_outlined),
          const Gap(10),
          const FormInput(label: 'Quantity added', value: '100 strips', icon: Icons.add_box_outlined),
          const Gap(10),
          const FormInput(label: 'Previous total quantity', value: '72 strips', icon: Icons.history_rounded),
          const Gap(10),
          const FormInput(label: 'New total quantity', value: '172 strips', icon: Icons.inventory_rounded),
          const Gap(10),
          const FormInput(label: 'Total amount paid for this stock', value: '৳2,800', icon: Icons.payments_outlined),
          const Gap(10),
          const FormInput(label: 'Entry date', value: '15 July 2026', icon: Icons.calendar_today_outlined),
          const Gap(12),
          const InfoBox(
            title: 'Medicine stock entry',
            message: 'Add 100 strips to the current stock. Current stock quantity and total value update immediately.',
          ),
          const Gap(18),
          PrimaryActionButton(label: 'Save product entry', onPressed: () => Navigator.pushNamed(context, AppRoutes.productDetail)),
        ],
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TrackerPage(
      activeTab: TrackerTab.products,
      child: TrackerScrollView(
        children: [
          ScreenHeader(title: 'Product Detail', subtitle: 'Medicine • PARA500 • Strip'),
          const Gap(14),
          const StatBanner(label: 'Current stock quantity', value: '140 strips', caption: 'Total stock value: ৳5,600'),
          const Gap(12),
          _PlainPanel(
            title: 'Quantity entries',
            children: const [
              _AmountLine(label: 'Added 100 strips', value: '৳2,800'),
              _AmountLine(label: '15 Jul • Supplier: City Pharma', value: ''),
              Divider(height: 18),
              _AmountLine(label: 'Added 20 strips', value: '৳1,300'),
              _AmountLine(label: '12 Jul • Opening stock', value: ''),
              Divider(height: 18),
              _AmountLine(label: 'Opening quantity', value: '৳975'),
            ],
          ),
          const Gap(12),
          const InfoBox(
            title: 'Medicine details',
            message: 'Default sell price ৳70 per strip. GST category details appear only when needed.',
          ),
          const Gap(18),
          PrimaryActionButton(label: 'Add more quantity', icon: Icons.add_rounded, onPressed: () => Navigator.pushNamed(context, AppRoutes.addStock)),
        ],
      ),
    );
  }
}

class DueCustomersScreen extends StatelessWidget {
  const DueCustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TrackerPage(
      activeTab: TrackerTab.dues,
      child: TrackerScrollView(
        children: [
          ScreenHeader(title: 'Due customers', subtitle: 'Only unpaid sale amounts'),
          const Gap(14),
          const StatBanner(label: 'Total customer due', value: '৳6,300', color: AppColors.amberDark),
          const Gap(12),
          const SearchBarField(hint: 'Search by customer name or mobile number'),
          const Gap(10),
          const ChoicePills(items: ['All 12', 'Recent', 'Highest due'], selectedIndex: 0),
          const Gap(12),
          const SectionHeader(title: 'Customer dues'),
          const Gap(8),
          for (final customer in DemoTrackerData.dueCustomers) ...[
            RecordTile(
              title: customer.name,
              subtitle: '${customer.phone} • ${customer.items}',
              trailing: customer.amount,
              icon: Icons.person_outline_rounded,
              onTap: () => Navigator.pushNamed(context, AppRoutes.dueDetail),
            ),
            const Gap(8),
          ],
          const Gap(12),
          const InfoBox(
            title: 'How customers appear here',
            message: 'A customer is listed automatically when a sale is marked Not fully paid. Their name, mobile number and remaining amount are stored.',
            color: AppColors.softAmber,
          ),
          const Gap(18),
          PrimaryActionButton(label: 'Open selected customer', onPressed: () => Navigator.pushNamed(context, AppRoutes.dueDetail)),
        ],
      ),
    );
  }
}

class DueDetailScreen extends StatelessWidget {
  const DueDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TrackerPage(
      activeTab: TrackerTab.dues,
      child: TrackerScrollView(
        children: [
          ScreenHeader(title: 'Rahim Uddin', subtitle: '01711 345 678 • Due customer'),
          const Gap(14),
          const StatBanner(label: 'Current unpaid amount', value: '৳1,250', color: AppColors.amberDark),
          const Gap(12),
          _PlainPanel(
            title: 'Unpaid items',
            children: const [
              _AmountLine(label: 'LED bulb 12W', value: '৳60'),
              _AmountLine(label: '2 pcs × ৳180 • Paid ৳300', value: ''),
              Divider(height: 18),
              _AmountLine(label: 'Paracetamol 500mg', value: '৳385'),
              _AmountLine(label: '5 strips • Partly paid', value: ''),
              Divider(height: 18),
              _AmountLine(label: 'Notebook A5 charger', value: '৳805'),
            ],
          ),
          const Gap(12),
          _PlainPanel(
            title: 'Total dues amount',
            children: const [
              _AmountLine(label: 'Total already paid', value: '৳750'),
              _AmountLine(label: 'Due', value: '৳1,250', strong: true),
            ],
          ),
          const Gap(12),
          const InfoBox(title: 'Customer contact', message: 'Customer mobile: 01711 345 678', color: AppColors.softBlue),
          const Gap(18),
          PrimaryActionButton(label: 'Collect a due payment', onPressed: () => Navigator.pushNamed(context, AppRoutes.collectDue)),
        ],
      ),
    );
  }
}

class CollectDueScreen extends StatelessWidget {
  const CollectDueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TrackerPage(
      activeTab: TrackerTab.dues,
      child: TrackerScrollView(
        children: [
          ScreenHeader(title: 'Collect due', subtitle: 'Reduce the customer unpaid amount'),
          const Gap(14),
          const FormInput(label: 'Customer', value: 'Rahim Uddin • 01712 345 678', icon: Icons.person_outline_rounded),
          const Gap(10),
          const FormInput(label: 'Amount received', value: '৳500', icon: Icons.payments_outlined),
          const Gap(10),
          const FormInput(label: 'Payment date', value: '19 July 2026', icon: Icons.calendar_today_outlined),
          const Gap(10),
          const FormInput(label: 'Remarks', value: 'Cash received at store', icon: Icons.note_alt_outlined),
          const Gap(12),
          _PlainPanel(
            title: 'Previous due',
            children: const [
              _AmountLine(label: 'Previous due', value: '৳1,250'),
              _AmountLine(label: 'Received now', value: '৳500'),
              Divider(height: 18),
              _AmountLine(label: 'Due after saving', value: '৳750', strong: true),
            ],
          ),
          const Gap(12),
          const InfoBox(
            title: 'New due after saving: ৳750',
            message: 'Only Rahim’s due amount is reduced. No cash account or accounting report is created.',
          ),
          const Gap(18),
          PrimaryActionButton(label: 'Save due payment', onPressed: () => Navigator.pushNamed(context, AppRoutes.dues)),
        ],
      ),
    );
  }
}

class MfsTransactionsScreen extends StatelessWidget {
  const MfsTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TrackerPage(
      activeTab: TrackerTab.mfs,
      child: TrackerScrollView(
        children: [
          ScreenHeader(
            title: 'MFS transactions',
            subtitle: 'Only simple customer transaction records',
            trailing: RoundIconButton(
              icon: Icons.settings_outlined,
              onPressed: () => Navigator.pushNamed(context, AppRoutes.settings),
            ),
          ),
          const Gap(14),
          const StatBanner(label: "Today's MFS records", value: '7 transactions', caption: 'Cash in: ৳8,500 • Cash out: ৳3,200'),
          const Gap(12),
          const SearchBarField(hint: 'Search TXN ID, name or number'),
          const Gap(10),
          const ChoicePills(items: ['All', 'Cash in', 'Cash out'], selectedIndex: 0),
          const Gap(12),
          const SectionHeader(title: 'Recent transactions'),
          const Gap(8),
          for (final item in DemoTrackerData.mfsTransactions) ...[
            RecordTile(title: item.name, subtitle: '${item.method} • ${item.number}', trailing: item.amount, icon: Icons.account_balance_wallet_outlined),
            const Gap(8),
          ],
          const Gap(16),
          PrimaryActionButton(label: 'Add MFS transaction', icon: Icons.add_rounded, onPressed: () => Navigator.pushNamed(context, AppRoutes.newMfs)),
          const Gap(8),
          SecondaryActionButton(label: 'Monthly summary', icon: Icons.bar_chart_rounded, onPressed: () => Navigator.pushNamed(context, AppRoutes.monthlySummary)),
        ],
      ),
    );
  }
}

class NewMfsTransactionScreen extends StatelessWidget {
  const NewMfsTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TrackerPage(
      activeTab: TrackerTab.mfs,
      child: TrackerScrollView(
        children: [
          ScreenHeader(title: 'New MFS transaction', subtitle: 'Save the TXN ID or reference only'),
          const Gap(14),
          const Text('Transaction type', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900)),
          const Gap(8),
          const ChoicePills(items: ['Cash in', 'Cash out'], selectedIndex: 0),
          const Gap(10),
          const FormInput(label: 'Transaction ID', value: 'BKASH721', icon: Icons.tag_rounded),
          const Gap(10),
          const FormInput(label: 'Customer name', value: 'Karim Ahmed', icon: Icons.person_outline_rounded),
          const Gap(10),
          const FormInput(label: 'Mobile number', value: '01712 345 900', icon: Icons.phone_outlined),
          const Gap(10),
          const FormInput(label: 'Amount', value: '৳2,000', icon: Icons.payments_outlined),
          const Gap(10),
          const FormInput(label: 'Date and time', value: '18 July 2026 • 4:20 PM', icon: Icons.calendar_today_outlined),
          const Gap(12),
          const InfoBox(
            title: 'Record only',
            message: 'This stores the transaction ID, type, customer name, mobile number, and amount. No accounting ledger is created.',
          ),
          const Gap(18),
          PrimaryActionButton(label: 'Save MFS transaction', onPressed: () => Navigator.pushNamed(context, AppRoutes.mfs)),
        ],
      ),
    );
  }
}

class MonthlySummaryScreen extends StatelessWidget {
  const MonthlySummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TrackerPage(
      activeTab: TrackerTab.home,
      child: TrackerScrollView(
        children: [
          ScreenHeader(title: 'Monthly summary', subtitle: 'July 2026 • All shop records'),
          const Gap(14),
          const StatBanner(label: 'Sales amount', value: '৳84,500', caption: '286 sale entries across saved products', icon: Icons.receipt_long_rounded),
          const Gap(12),
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.72,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              MetricTile(metric: Metric(label: 'Amount received', value: '৳78,200', icon: Icons.payments_outlined)),
              MetricTile(metric: Metric(label: 'Due left', value: '৳6,300', icon: Icons.warning_amber_rounded, color: AppColors.amber)),
              MetricTile(metric: Metric(label: 'Product entries', value: '34', icon: Icons.inventory_2_outlined)),
              MetricTile(metric: Metric(label: 'Products', value: '52 / 400', icon: Icons.category_outlined)),
            ],
          ),
          const Gap(12),
          _PlainPanel(
            title: 'MFS totals',
            children: const [
              _AmountLine(label: 'MFS cash-in records', value: '৳8,500'),
              _AmountLine(label: 'MFS cash-out records', value: '৳3,200'),
              _AmountLine(label: 'Total transactions count', value: '18'),
              _AmountLine(label: 'Due customers', value: '12'),
            ],
          ),
          const Gap(12),
          const InfoBox(
            title: 'This is not an accounting report',
            message: 'This summary only combines sales, product stock, due, and MFS records for simple shop tracking.',
          ),
          const Gap(18),
          PrimaryActionButton(label: 'Export monthly record summary', icon: Icons.download_rounded, onPressed: () {}),
        ],
      ),
    );
  }
}

class TrackerSettingsScreen extends StatelessWidget {
  const TrackerSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TrackerPage(
      activeTab: TrackerTab.home,
      child: TrackerScrollView(
        children: [
          ScreenHeader(title: 'Settings', subtitle: 'Manage business preferences for any shop'),
          const Gap(14),
          const InfoBox(title: 'Maa General Store', message: 'Store, category based products, dues and MFS', color: AppColors.primaryLight),
          const Gap(14),
          const SectionHeader(title: 'Store information'),
          const Gap(8),
          const _SettingsTile(icon: Icons.storefront_rounded, title: 'Store profile', subtitle: 'Name, address, mobile and store type'),
          const Gap(8),
          const _SettingsTile(icon: Icons.category_outlined, title: 'Product categories', subtitle: 'Grocery, electronics, medicines, other'),
          const Gap(8),
          const _SettingsTile(icon: Icons.inventory_2_outlined, title: 'Units & low quantity warning', subtitle: 'kg, pcs, strip, box and alerts'),
          const Gap(14),
          const SectionHeader(title: 'Data'),
          const Gap(8),
          const _SettingsTile(icon: Icons.file_download_outlined, title: 'Export records', subtitle: 'Sales, products, dues and MFS'),
          const Gap(8),
          const _SettingsTile(icon: Icons.backup_outlined, title: 'Backup & restore', subtitle: 'Keep records safe'),
          const Gap(8),
          const _SettingsTile(icon: Icons.cleaning_services_outlined, title: 'Clear test records', subtitle: 'Remove demo entries'),
          const Gap(14),
          const SectionHeader(title: 'Preferences'),
          const Gap(8),
          const _SettingsTile(icon: Icons.language_rounded, title: 'Language', subtitle: 'English'),
          const Gap(8),
          const _SettingsTile(icon: Icons.currency_exchange_rounded, title: 'Currency', subtitle: 'Bangladeshi Taka (৳)'),
        ],
      ),
    );
  }
}

class _PlainPanel extends StatelessWidget {
  const _PlainPanel({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w900)),
          const SizedBox(height: 9),
          ...children,
        ],
      ),
    );
  }
}

class _AmountLine extends StatelessWidget {
  const _AmountLine({required this.label, required this.value, this.strong = false});

  final String label;
  final String value;
  final bool strong;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: strong ? AppColors.textPrimary : AppColors.textSecondary,
                fontSize: strong ? 13 : 11,
                fontWeight: strong ? FontWeight.w900 : FontWeight.w700,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(fontSize: strong ? 13 : 11, fontWeight: strong ? FontWeight.w900 : FontWeight.w800),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({required this.icon, required this.title, required this.subtitle});

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return RecordTile(
      title: title,
      subtitle: subtitle,
      trailing: 'Open',
      icon: icon,
      highlight: true,
    );
  }
}
