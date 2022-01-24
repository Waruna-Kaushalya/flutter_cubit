//!export all the packges in one place.
//!Advantage is easyly manage when chnage folder structrue.
//!less code

//? Dart
export 'dart:async';
export 'dart:convert';

//? Thired part packages
export 'package:connectivity_plus/connectivity_plus.dart';
export 'package:flutter/material.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:path_provider/path_provider.dart';
export 'package:hydrated_bloc/hydrated_bloc.dart';
export 'package:equatable/equatable.dart';
export 'package:hydrated_bloc/hydrated_bloc.dart';

//? Screens
export 'package:flutter_bloc_concepts/features/feature_3_counter/presentation/screens/home_screen.dart';
export 'package:flutter_bloc_concepts/features/feature_1_settings/presentation/screens/settings_screen.dart';
export 'package:flutter_bloc_concepts/features/feature_3_counter/presentation/screens/second_screen.dart';
export 'package:flutter_bloc_concepts/features/feature_3_counter/presentation/screens/third_screen.dart';

//? Bloc
export 'package:flutter_bloc_concepts/utility/app_bloc_observer.dart';
export 'package:flutter_bloc_concepts/features/feature_1_settings/logic/cubit/settingscubit_cubit.dart';
export 'package:flutter_bloc_concepts/features/feature_2_conectivity/logic/cubit/internet_cubit.dart';
export 'package:flutter_bloc_concepts/features/feature_3_counter/logic/cubit/counter_cubit.dart';

//? Routes
export 'package:flutter_bloc_concepts/routes/app_routes.dart';

//? Enums
export 'package:flutter_bloc_concepts/utility/constants/enums.dart';

//? Data

//? Reposotory

//? Widgest
