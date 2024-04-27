import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/components/bottom_bar_components.dart';
import 'package:shopping_cart/controllers/PostControllers/add_delete_favorite_controller.dart';
import 'package:shopping_cart/controllers/PostControllers/favorites_controller.dart';
import 'package:shopping_cart/controllers/PostControllers/search_product_controller.dart';
import 'package:shopping_cart/model/product_list_modal.dart';
import 'package:shopping_cart/pages/AccountPages/NotificationPage.dart';
import 'package:shopping_cart/pages/AccountPages/custom_orders_page.dart';
import 'package:shopping_cart/pages/AccountPages/profile_page.dart';
import 'package:shopping_cart/pages/CartPages/cart_page.dart';
import 'package:shopping_cart/pages/CategoryPages/category_page.dart';
import 'package:shopping_cart/pages/HomePages/home_page.dart';
import 'package:shopping_cart/pages/AccountPages/help_support_page.dart';
import 'package:shopping_cart/pages/OrderPages/my_orders_page.dart';
import 'package:shopping_cart/pages/AccountPages/privacy_page.dart';
import 'package:shopping_cart/pages/product_details_page.dart';
import 'package:shopping_cart/pages/AccountPages/settings_page.dart';
import 'package:shopping_cart/pages/AccountPages/terms_conditions_page.dart';
import 'package:shopping_cart/pages/AccountPages/wishlist_favorites_page.dart';
import 'components/exit_material_app.dart';
import 'controllers/GetControllers/category_list_controller.dart';
import 'controllers/PostControllers/add_to_cart_controller.dart';
import 'controllers/PostControllers/fcm_token_controller.dart';
import 'controllers/PostControllers/get_cart_item_controller.dart';
import 'controllers/PostControllers/get_sub_category_list_controller.dart';
import 'controllers/all_products_controller.dart';
import 'controllers/GetControllers/product_list_controller.dart';
import 'controllers/application_controller.dart';
import 'controllers/sub_category_list_controller.dart';

class MyBottomNavigationPage extends StatelessWidget {
  MyBottomNavigationPage({Key? key}) : super(key: key);
  final appController = Get.find<ApplicationController>();

  final categoryListController = Get.put(CategoryListController());

  final productListController = Get.put(ProductsListController());

  final subCategoryController = Get.put(SubCategoryListController());
  final getCategoryController = Get.put(GetSubCategoryListController());

  final searchProductsController = Get.put(SearchProductsController());

  final cartController = Get.put(CartController());
  final favoritesController = Get.put(FavoritesController());
  final fcmTokenController = Get.put(FcmTokenController());

  final addFavoriteController = Get.lazyPut(() => AddFavoriteController());
  final getSubCategoriesListController =
      Get.lazyPut(() => GetSubCategoryListController());
  final addToCartController = Get.lazyPut(() => AddToCartController());

  final allProductsController = Get.lazyPut(() => AllProductsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Obx(() =>
                _buildTabScreens(appController.currentSelectedTabIndex.value)),
            bottomNavigationBar: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                  ],
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: GestureDetector(
                            onTap: () => appController.setCurrentSelectedTab(0),
                            child: Obx(() => commonBottomTab(
                                appController.currentSelectedTabIndex.value,
                                0))),
                      ),
                      Expanded(
                        child: GestureDetector(
                            onTap: () => appController.setCurrentSelectedTab(1),
                            child: Obx(() => commonBottomTab(
                                appController.currentSelectedTabIndex.value,
                                1))),
                      ),
                      Expanded(
                        child: GestureDetector(
                            onTap: () => appController.setCurrentSelectedTab(2),
                            child: Obx(() => commonBottomTab(
                                appController.currentSelectedTabIndex.value,
                                2))),
                      ),
                      Expanded(
                        child: GestureDetector(
                            onTap: () => appController.setCurrentSelectedTab(3),
                            child: Obx(() => commonBottomTab(
                                appController.currentSelectedTabIndex.value,
                                3))),
                      ),
                      Expanded(
                        child: GestureDetector(
                            onTap: () => appController.setCurrentSelectedTab(4),
                            child: Obx(() => commonBottomTab(
                                appController.currentSelectedTabIndex.value,
                                4))),
                      ),
                    ])),
          );
  }

  Widget _buildTabScreens(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return HomeTabNavigator();
      case 1:
        return CategoryTabNavigator();
      case 2:
        return OrdersTabNavigator();
      case 3:
        return CartTabNavigator();
      case 4:
        return AccountTabNavigator();
      default:
        return HomeTabNavigator();
    }
  }
}

class HomeTabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKeyHome =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_navigatorKeyHome.currentState!.canPop()) {
          // If there's a route to pop within the tab, pop it.
          _navigatorKeyHome.currentState!.pop();
          return false;
        } else {
          // If there are no more routes to pop, exit the tab.
          return exitMaterialApp(
              context); // You should define the exitTab function.
        }
      },
      child: Navigator(
        key: _navigatorKeyHome,
        initialRoute: '/',
        onGenerateRoute: (settings) {
          final arguments =
              settings.arguments; // Get the arguments from the route

          switch (settings.name) {
            case '/':
              return MaterialPageRoute(builder: (context) => HomePage());
            case '/product_details':
              // Check if the route has arguments
              return MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(product: arguments));
            default:
              return null;
          }
        },
      ),
    );
  }
}

class CategoryTabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKeyCategory =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (_navigatorKeyCategory.currentState!.canPop()) {
            // If there's a route to pop within the tab, pop it.
            _navigatorKeyCategory.currentState!.pop();
            return false;
          } else {
            // If there are no more routes to pop, exit the tab.
            return exitMaterialApp(
                context); // You should define the exitTab function.
          }
        },
        child: Navigator(
          key: _navigatorKeyCategory,
          initialRoute: '/',
          onGenerateRoute: (settings) {
            final arguments =
                settings.arguments; // Get the arguments from the route

            switch (settings.name) {
              case '/':
                return MaterialPageRoute(builder: (context) => CategoryPage());
              case '/product_details':
                // Check if the route has arguments
                if (arguments is Product) {
                  return MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailsPage(product: arguments));
                } else {
                  // Handle an error or default behavior when arguments are missing
                  return MaterialPageRoute(
                      builder: (context) => ProductDetailsPage(product: null));
                }
              // case '/product_listing':
              //   // Check if the route has arguments
              //   if (arguments is Category) {
              //     return MaterialPageRoute(
              //         builder: (context) =>
              //             ProductListingPage(selectedCategory: arguments));
              //   } else {
              //     // Handle an error or default behavior when arguments are missing
              //     return MaterialPageRoute(
              //         builder: (context) =>
              //             ProductListingPage(selectedCategory: null));
              //   }
              default:
                return null;
            }
          },
        ));
  }
}

class OrdersTabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKeyOrders =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (_navigatorKeyOrders.currentState!.canPop()) {
            // If there's a route to pop within the tab, pop it.
            _navigatorKeyOrders.currentState!.pop();
            return false;
          } else {
            // If there are no more routes to pop, exit the tab.
            return exitMaterialApp(
                context); // You should define the exitTab function.
          }
        },
        child: Navigator(
          key: _navigatorKeyOrders,
          onGenerateRoute: (settings) {
            final arguments =
                settings.arguments; // Get the arguments from the route

            switch (settings.name) {
              case '/':
                return MaterialPageRoute(builder: (context) => MyOrdersPage());
              case '/product_details':
                // Check if the route has arguments
                if (arguments is Product) {
                  return MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailsPage(product: arguments));
                } else {
                  // Handle an error or default behavior when arguments are missing
                  return MaterialPageRoute(
                      builder: (context) => ProductDetailsPage(product: null));
                }
              default:
                return null;
            }
          },
        ));
  }
}

class CartTabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKeyCart =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (_navigatorKeyCart.currentState!.canPop()) {
            // If there's a route to pop within the tab, pop it.
            _navigatorKeyCart.currentState!.pop();
            return false;
          } else {
            // If there are no more routes to pop, exit the tab.
            return exitMaterialApp(
                context); // You should define the exitTab function.
          }
        },
        child: Navigator(
          key: _navigatorKeyCart,
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(builder: (context) => CartPage());
              default:
                return null;
            }
          },
        ));
  }
}

class AccountTabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKeyAccount =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (_navigatorKeyAccount.currentState!.canPop()) {
            // If there's a route to pop within the tab, pop it.
            _navigatorKeyAccount.currentState!.pop();
            return false;
          } else {
            // If there are no more routes to pop, exit the tab.
            return exitMaterialApp(
                context); // You should define the exitTab function.
          }
        },
        child: Navigator(
          key: _navigatorKeyAccount,
          initialRoute: '/',
          onGenerateRoute: (settings) {
            final arguments =
                settings.arguments; // Get the arguments from the route

            switch (settings.name) {
              case '/':
                return MaterialPageRoute(builder: (context) => SettingsPage());
              case '/profile':
                return MaterialPageRoute(builder: (context) => ProfilePage());
              case '/support':
                return MaterialPageRoute(
                    builder: (context) => HelpSupportPage());
              case '/privacy':
                return MaterialPageRoute(
                    builder: (context) => PrivacyPolicyPage());
              case '/notifications':
                return MaterialPageRoute(
                    builder: (context) => NotificationPage());
              case '/tnc':
                return MaterialPageRoute(
                    builder: (context) => TermsConditionsPage());
              case '/wishlist':
                return MaterialPageRoute(
                    builder: (context) => WishlistFavoritesPage());
              case '/product_details':
                // Check if the route has arguments
                if (arguments is Product) {
                  return MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailsPage(product: arguments));
                } else {
                  // Handle an error or default behavior when arguments are missing
                  return MaterialPageRoute(
                      builder: (context) => ProductDetailsPage(product: null));
                }
              case '/orders':
                return MaterialPageRoute(builder: (context) => MyOrdersPage());
              case '/custom_order':
                return MaterialPageRoute(
                    builder: (context) => CustomOrdersPage());
              default:
                return null;
            }
          },
        ));
  }
}