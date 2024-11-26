import 'package:bloc/bloc.dart';
import 'package:islamicapp/feature/salah/logic/services/getShalahTime.dart';
import 'package:meta/meta.dart';

part 'salah_state.dart';

class SalahCubit extends Cubit<SalahState> {
  SalahCubit() : super(SalahInitial());

void fetchPrayerTimes() {
  final SalahService getTimes = SalahService();
  emit(SalahLoading());

  getTimes.getPrayerTimes().then((response) {
    // Expecting response to contain both prayerTimes and date
    final prayerTimes = response['prayerTimes'];
    final date = response['date'];
    emit(SalahLoadded(prayerTimes, date));
  }).catchError((error) {
    emit(SalahError(error.toString())); // Ensure error is a string
  });
}

}
