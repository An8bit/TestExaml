
 import 'package:testmobile/model/student.dart';

import '../enum/LoadStatus.dart';

class MainState {
  final LoadStatus loadStatus;
  final List<Student> student;
 
  MainState({required this.loadStatus, required this.student});

  MainState copyWith({LoadStatus? loadStatus, List<Student>? student}) {
    return MainState(
      loadStatus: loadStatus ?? this.loadStatus,
      student: student ?? this.student,
    );
  }

  factory MainState.Init() {
    return MainState(loadStatus: LoadStatus.Init, student:const []);
  }

  @override
  String toString() {
    return 'MainState{loadStatus: $loadStatus, student: $student}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MainState &&
      other.loadStatus == loadStatus &&
      other.student == student;
  }

  @override
  int get hashCode {
    return loadStatus.hashCode ^
      student.hashCode;
  }



 }


