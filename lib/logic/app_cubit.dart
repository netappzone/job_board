import 'package:job_board/data/models/jobs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../data/repository/jobs_repository.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  List<Jobs> jobs = [];

  List<Jobs> acceptedJobs = [];

  List<Jobs> getAllJobs() {
    JobsRepository.getAllJobs().then((jobs) {
      this.jobs = jobs;
      jobs.sort((a, b) {
        return a.datePosted!.compareTo(b.datePosted!);
      });
      emit(GetAllJobsSuccess());
    });
    return jobs;
  }

  List<Jobs> removeJobs(Jobs job) {
    final currentState = state;
    if (currentState is GetAllJobsSuccess) {
      jobs.remove(job);

      emit(GetAllJobsSuccess());
    }
    return acceptedJobs;
  }

  List<Jobs> getAcceptedJobs(Jobs job) {
    final currentState = state;
    if (currentState is GetAllJobsSuccess) {
      acceptedJobs.add(job);
      acceptedJobs.sort((a, b) {
        return a.datePosted!.compareTo(b.datePosted!);
      });
      removeJobs(job);
      emit(GetAllJobsSuccess());
    }
    return acceptedJobs;
  }
}
