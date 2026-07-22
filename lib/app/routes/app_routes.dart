import 'package:flutter/material.dart';

import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/signup_screen.dart';
import '../../features/auth/presentation/verify_email_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/tracker/presentation/tracker_screens.dart';

class AppRoutes {
  AppRoutes._();

  static const onboarding = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const verifyEmail = '/verify-email';

  static const home = '/home';
  static const newSale = '/new-sale';
  static const saleSaved = '/sale-saved';
  static const salesHistory = '/sales-history';
  static const products = '/products';
  static const addProduct = '/add-product';
  static const addStock = '/add-stock';
  static const productDetail = '/product-detail';
  static const dues = '/dues';
  static const dueDetail = '/due-detail';
  static const collectDue = '/collect-due';
  static const mfs = '/mfs';
  static const newMfs = '/new-mfs';
  static const monthlySummary = '/monthly-summary';
  static const settings = '/settings';

  // Legacy names kept so older starter screens remain analyzable if opened.
  static const scan = newSale;
  static const productSearch = products;
  static const personalizedAlerts = dues;
  static const dashboard = home;
  static const privacy = settings;

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    late final Widget page;

    switch (routeSettings.name) {
      case AppRoutes.onboarding:
        page = const OnboardingScreen();
        break;
      case AppRoutes.login:
        page = const LoginScreen();
        break;
      case AppRoutes.signup:
        page = const SignupScreen();
        break;
      case AppRoutes.verifyEmail:
        page = VerifyEmailScreen(
          arguments: routeSettings.arguments is VerifyEmailArguments
              ? routeSettings.arguments! as VerifyEmailArguments
              : const VerifyEmailArguments(email: 'karim@example.com'),
        );
        break;
      case AppRoutes.home:
        page = const HomeScreen();
        break;
      case AppRoutes.newSale:
        page = const NewSaleScreen();
        break;
      case AppRoutes.saleSaved:
        page = const SaleSavedScreen();
        break;
      case AppRoutes.salesHistory:
        page = const SalesHistoryScreen();
        break;
      case AppRoutes.products:
        page = const ProductsScreen();
        break;
      case AppRoutes.addProduct:
        page = const AddProductScreen();
        break;
      case AppRoutes.addStock:
        page = const AddStockEntryScreen();
        break;
      case AppRoutes.productDetail:
        page = const ProductDetailScreen();
        break;
      case AppRoutes.dues:
        page = const DueCustomersScreen();
        break;
      case AppRoutes.dueDetail:
        page = const DueDetailScreen();
        break;
      case AppRoutes.collectDue:
        page = const CollectDueScreen();
        break;
      case AppRoutes.mfs:
        page = const MfsTransactionsScreen();
        break;
      case AppRoutes.newMfs:
        page = const NewMfsTransactionScreen();
        break;
      case AppRoutes.monthlySummary:
        page = const MonthlySummaryScreen();
        break;
      case AppRoutes.settings:
        page = const TrackerSettingsScreen();
        break;
      default:
        page = const OnboardingScreen();
        break;
    }

    return MaterialPageRoute<dynamic>(
      builder: (_) => page,
      settings: routeSettings,
    );
  }
}
