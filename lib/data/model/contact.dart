class Contact {
  final String date;
  final String name;
  final String email;
  final String job;
  final String message;
  final String phone;
  Contact({
    required this.date,
    required this.name,
    required this.email,
    required this.job,
    this.message = '',
    this.phone = '',
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        date: json['date'],
        name: json['name'],
        job: json['job'],
        email: json['email'],
        message: json['message'],
        phone: json['phone'],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "name": name,
        "job": job,
        "email": email,
        "message": message,
        "phone": phone
      };
}
