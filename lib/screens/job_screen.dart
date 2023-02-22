import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'job_screen.g.dart';

class Job {
  Job({
    required this.id,
    required this.descriptiron,
    required this.isCompleted,
  });
  final String id;
  final String descriptiron;
  final bool isCompleted;

  Job copyWith({String? id, String? descriptiron, bool? isCompleted}) {
    return Job(
        id: id ?? this.id,
        descriptiron: descriptiron ?? this.descriptiron,
        isCompleted: isCompleted ?? this.isCompleted);
  }
}

@riverpod
class Jobs extends _$Jobs {
  @override
  List<Job> build() {
    print('jobsProvider build');
    ref.onDispose(() {
      print('jobsProvider onDispose');
    });
    return [
      Job(id: '1', descriptiron: '쁘미 밥 주기', isCompleted: false),
      Job(id: '2', descriptiron: '또리 물 주기', isCompleted: true),
      Job(id: '3', descriptiron: '깜봉 놀아 주기', isCompleted: true),
    ];
  }

  void addJob(Job job) {
    state = [...state, job];
  }

  void toggle(String jobId) {
    state = [
      for (final job in state)
        if (job.id == jobId)
          job.copyWith(isCompleted: !job.isCompleted)
        else
          job
    ];
  }
}

@riverpod
List<Job> completedJobs(CompletedJobsRef ref) {
  print('completedJobsProvider');
  ref.onDispose(() {
    print('completedJobsProvider onDispose');
  });
  final jobs = ref.watch(jobsProvider);
  return jobs.where((job) => job.isCompleted).toList();
}

class JobScreen extends StatelessWidget {
  const JobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('job (NotifierProvider)')),
      body: Consumer(
        builder: (context, ref, child) {
          final completedJobs = ref.watch(completedJobsProvider);

          return ListView(children: [
            for (final job in completedJobs)
              CheckboxListTile(
                value: job.isCompleted,
                onChanged: (value) {
                  ref.read(jobsProvider.notifier).toggle(job.id);
                },
                title: Text(job.descriptiron),
              )
          ]);
        },
      ),
    );
  }
}
