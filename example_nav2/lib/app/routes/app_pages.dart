import 'package:example_nav2/app/modules/root/bindings/root_binding.dart';
import 'package:example_nav2/app/modules/root/views/root_view.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/nav2/router_outlet.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/product_details/bindings/product_details_binding.dart';
import '../modules/product_details/views/product_details_view.dart';
import '../modules/products/bindings/products_binding.dart';
import '../modules/products/views/products_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: '/',
      page: () => RootView(),
      middlewares: [
        RouterOutletContainerMiddleWare('/'),
      ],
      binding: RootBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          preventDuplicates: true,
          page: () => HomeView(),
          bindings: [
            HomeBinding(),
          ],
          title: null,
          children: [
            GetPage(
              name: _Paths.PROFILE,
              page: () => ProfileView(),
              title: 'Profile',
              transition: Transition.size,
              binding: ProfileBinding(),
            ),
            GetPage(
              name: _Paths.PRODUCTS,
              page: () => ProductsView(),
              title: 'Products',
              transition: Transition.zoom,
              binding: ProductsBinding(),
              children: [
                GetPage(
                  name: _Paths.PRODUCT_DETAILS,
                  page: () => ProductDetailsView(),
                  binding: ProductDetailsBinding(),
                ),
              ],
            ),
          ],
        ),
        GetPage(
          name: _Paths.SETTINGS,
          page: () => SettingsView(),
          binding: SettingsBinding(),
        ),
      ],
    ),
  ];
}
