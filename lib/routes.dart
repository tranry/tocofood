
import 'package:totofood/screens/cart/components/payment_page.dart';
import 'package:totofood/screens/favourite/favourity_screen.dart';
import 'package:totofood/screens/home/components/history.dart';
import 'package:totofood/screens/message/message_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:totofood/screens/cart/cart_screen.dart';
import 'package:totofood/screens/complete_profile/complete_profile_screen.dart';
import 'package:totofood/screens/details/details_screen.dart';
import 'package:totofood/screens/forgot_password/forgot_password_screen.dart';
import 'package:totofood/screens/home/home_screen.dart';
import 'package:totofood/screens/profile/profile_screen.dart';
import 'package:totofood/screens/sign_in/sign_in_screen.dart';
import 'package:totofood/screens/splash/splash_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {

  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  DetailsScreen.routeName: (context) => const DetailsScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  FavourityScreen.routeName:(context)=> const FavourityScreen(),
  MessageScreen.routeName:(context)=> const MessageScreen(),
  PurchaseHistoryWidget.routeName:(context)=>  PurchaseHistoryWidget(),
};
