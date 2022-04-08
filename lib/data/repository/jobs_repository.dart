import 'package:job_board/data/models/jobs.dart';

import '../services/job_services.dart';

class JobsRepository {
  static Future<List<Jobs>> getAllJobs() async {
    final jobs = await JobsServices.getAllJobs();
    return jobs.map((job) => Jobs.fromJson(job)).toList();
  }
}
