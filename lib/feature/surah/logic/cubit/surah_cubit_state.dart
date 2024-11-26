part of 'surah_cubit_cubit.dart';

@immutable
abstract class SurahCubitState {}

class SurahCubitInitial extends SurahCubitState {}

class SurahCubitLoading extends SurahCubitState {}

class SurahCubitLoaded extends SurahCubitState {
  final List<Surah> surahs;
  SurahCubitLoaded(this.surahs);
}

class SurahCubitError extends SurahCubitState {
  final String error;
  SurahCubitError(this.error);
}
