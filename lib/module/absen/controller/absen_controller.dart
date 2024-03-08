import 'package:flutter/material.dart';
import 'package:saksi_apps/core.dart';
import '../view/absen_view.dart';

class AbsenController extends State<AbsenView> {
  static late AbsenController instance;
  late AbsenView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
