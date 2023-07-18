class PassedCourse {

final int courseId;
final double mark;

PassedCourse(this.courseId, this.mark);

factory PassedCourse.fromJson(Map<String, dynamic> json) {
return PassedCourse(
 json['course'],
 json['mark'],
);
}

Map<String, dynamic> toJson() {
return {
'course': courseId,
'mark': mark,
};
}
}