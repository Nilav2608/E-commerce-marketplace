class Api {
  final String baseUrl = "http://192.168.1.5:5000";

  final String loginUrl = "http://192.168.1.5:5000/api/v1/user/login";

  final String registerUrl = "http://192.168.1.5:5000/api/v1/user/registerUser";

  final String productsUrl = "http://192.168.1.5:5000/products";

  final String bannersUrl = "http://192.168.1.5:5000/api/v1/getAllBanners";

  final String userUrl = "http://192.168.1.5:5000/api/v1/user/getUser";

  final String addToCartUrl = "http://192.168.1.5:5000/api/v1/users/AddToCart";

  final String getUserCartUrl =
      "http://192.168.1.5:5000/api/v1/users/getuserCart";

  final String deleteUserCartUrl =
      "http://192.168.1.5:5000/api/v1/users/deleteCartItem";

  final String getUserOrdersUrl =
      "http://192.168.1.5:5000/api/v1/users/getUserOrders";

  final String newOrderUrl = "http://192.168.1.5:5000/api/v1/users/newOrder";

  final String cancelUserOrder =
      "http://192.168.1.5:5000/api/v1/users/newOrder";
}
