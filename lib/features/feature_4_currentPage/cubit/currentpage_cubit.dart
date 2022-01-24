import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_concepts/utility/exports.dart';

part 'currentpage_state.dart';

class CurrentpageCubit extends Cubit<CurrentpageState> {
  CurrentpageCubit() : super(CurrentpageInitial());
  // final abc = ModalRoute.of(context)?.settings.name;
}
