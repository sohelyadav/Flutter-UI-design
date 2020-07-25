import 'dart:convert';

ExpenseResponse expenseResponseFromJson(String str) => ExpenseResponse.fromJson(json.decode(str));

String expenseResponseToJson(ExpenseResponse data) => json.encode(data.toJson());

class ExpenseResponse {
  ExpenseResponse({
    this.expenseData,
  });

  List<ExpenseDatum> expenseData;

  factory ExpenseResponse.fromJson(Map<String, dynamic> json) => ExpenseResponse(
    expenseData: json["expenseData"] == null ? null : List<ExpenseDatum>.from(json["expenseData"].map((x) => ExpenseDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "expenseData": expenseData == null ? null : List<dynamic>.from(expenseData.map((x) => x.toJson())),
  };
}

class ExpenseDatum {
  ExpenseDatum({
    this.date,
    this.totalAmount,
    this.data,
  });

  String date;
  String totalAmount;
  List<Datum> data;

  factory ExpenseDatum.fromJson(Map<String, dynamic> json) => ExpenseDatum(
    date: json["date"] == null ? null : json["date"],
    totalAmount: json["totalAmount"] == null ? null : json["totalAmount"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "date": date == null ? null : date,
    "totalAmount": totalAmount == null ? null : totalAmount,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.logo,
    this.serviceName,
    this.teamName,
    this.amount,
  });

  String logo;
  String serviceName;
  String teamName;
  String amount;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    logo: json["logo"] == null ? null : json["logo"],
    serviceName: json["serviceName"] == null ? null : json["serviceName"],
    teamName: json["teamName"] == null ? null : json["teamName"],
    amount: json["amount"] == null ? null : json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "logo": logo == null ? null : logo,
    "serviceName": serviceName == null ? null : serviceName,
    "teamName": teamName == null ? null : teamName,
    "amount": amount == null ? null : amount,
  };
}
