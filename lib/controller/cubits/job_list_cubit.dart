import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project/model/job_item.dart';
import 'package:internship_project/services/auth_services.dart';

List<JobItem> _jobs = [
  JobItem(
    id: '1',
    title: 'Deep Cleaning',
    address: '123 Street, City',
    price: 1500,
    rating: 4.8,
    imageUrl: 'assets/image_unavailable.png',
  ),
];

class JobListCubit extends Cubit<List<JobItem>> {
  JobListCubit() : super(_jobs);

  void addJob(JobItem job) {
    // print("JobAdded");
    AuthService().saveToFirestore(job);
    emit([..._jobs, job]);
    // print("JobAddedFinal");
    // print(state);
  }
}
