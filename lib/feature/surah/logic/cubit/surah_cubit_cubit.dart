

import 'package:bloc/bloc.dart';
import 'package:islamicapp/feature/surah/logic/services/getSurah.dart';
import 'package:islamicapp/feature/surah/presentation/view_model/surah_model.dart';
import 'package:meta/meta.dart';

part 'surah_cubit_state.dart';

class SurahCubitCubit extends Cubit<SurahCubitState> {
  
  SurahCubitCubit() : super(SurahCubitInitial());

  // Method to fetch Surahs
  void fetchSurahs() {
    final getSurahService getSurah = getSurahService();
    // Emit loading state before fetching
    emit(SurahCubitLoading());

    // Fetch the surahs from the service
    getSurah.getSurah().then((surahs) {
      emit(SurahCubitLoaded(surahs)); // Emit loaded state with surahs data
    }).catchError((error) {
      // Emit error state if there's an issue with fetching
      emit(SurahCubitError(error.toString()));
    });
  }
}


