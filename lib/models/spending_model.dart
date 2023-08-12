class Spending_Model {
  int? id;
  String spending_name;
  String spending_amount;
  String spending_mode;
  String spending_type;
  String date;
  String time;

  Spending_Model({
    this.id,
    required this.spending_name,
    required this.spending_amount,
    required this.spending_mode,
    required this.spending_type,
    required this.date,
    required this.time,
  });

  factory Spending_Model.fromMap({required Map data}) {
    return Spending_Model(
      id: data['id'],
      spending_name: data['spending_name'],
      spending_amount: data['spending_amount'],
      spending_mode: data['spending_mode'],
      spending_type: data['spending_type'],
      date: data['date'],
      time: data['time'],
    );
  }
}
