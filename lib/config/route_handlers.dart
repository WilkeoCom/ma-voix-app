import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:ma_voix_app/pages/home.dart';
import 'package:ma_voix_app/pages/login.dart';
import 'package:ma_voix_app/pages/project_details.dart';

Handler homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
        HomePage());

Handler loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
        Login());

Handler projectHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  int projectId = int.parse(params["projectId"]?.first);

  return ProjectDetailsPage(projectId);
});
