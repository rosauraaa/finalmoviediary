import 'package:get/get.dart';
import '../screens/home/homeview.dart';
import '../screens/home/home_binding.dart';
import '../screens/fav_movies/favs.dart';
import '../screens/fav_movies/favs_binding.dart';
import '../screens/new_movie/newmovie.dart';
import '../screens/new_movie/newmovie_binding.dart';
import '../screens/reviews/reviews.dart';
import '../screens/reviews/reviews_binding.dart';
import '../screens/watchlist/watchlist.dart';
import '../screens/watchlist/watchlist_binding.dart';
import '../screens/auth/login_view.dart';
import '../screens/auth/login_binding.dart';
import '../screens/auth/register_view.dart';
import '../screens/auth/register_binding.dart';
import '../screens/profile/profile_view.dart';
import '../screens/profile/profile_binding.dart';
import '../screens/map_cinemas/mapview.dart';
import '../screens/map_cinemas/map_controller.dart';
import '../screens/map_cinemas/map_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.FAVS,
      page: () => FavsView(),
      binding: FavsBinding(),
    ),
    GetPage(
      name: AppRoutes.NEWMOVIE,
      page: () => NewMovieView(),
      binding: NewMovieBinding(),
    ),
    GetPage(
      name: AppRoutes.REVIEWS,
      page: () => ReviewsView(),
      binding: ReviewsBinding(),
    ),
    GetPage(
      name: AppRoutes.WATCHLIST,
      page: () => WatchlistView(),
      binding: WatchlistBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
  name: AppRoutes.MAP,
  page: () => MapView(),
  binding: MapBinding(),
),

  ];
}
