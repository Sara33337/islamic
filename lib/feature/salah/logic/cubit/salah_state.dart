part of 'salah_cubit.dart';

@immutable
abstract class SalahState {}

class SalahInitial extends SalahState {}

class SalahLoading extends SalahState {}

class SalahLoadded extends SalahState {
  final Map<String, dynamic> prayerTimes;
  final String ?date;
  SalahLoadded(this.prayerTimes , this.date);
}

class SalahError extends SalahState {
  final String error;
  SalahError(this.error);
}
