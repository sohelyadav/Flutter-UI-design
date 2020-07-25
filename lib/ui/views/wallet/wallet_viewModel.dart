import 'package:flutter/services.dart';
import 'package:klearcard/data/remote/expense/expense_model.dart';
import 'package:stacked/stacked.dart';
import 'dart:convert';

class WalletViewModel extends BaseViewModel {

  ExpenseResponse _expenseResponse;
  ExpenseResponse get expenseData => _expenseResponse;

  setExpenseData(ExpenseResponse expenseResponse){
    _expenseResponse = expenseResponse;
    notifyListeners();
  }

  fetchExpenseData() {
    setBusy(true);
    Future.delayed(const Duration(milliseconds: 4000), () async{
      String data = await rootBundle.loadString('assets/json/expense.json');
      var jsonResult = ExpenseResponse.fromJson(json.decode(data));
      setExpenseData(jsonResult);
      setBusy(false);
    });
  }
}
