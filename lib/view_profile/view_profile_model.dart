import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/project_components/nav/nav_widget.dart';
import 'view_profile_widget.dart' show ViewProfileWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ViewProfileModel extends FlutterFlowModel<ViewProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Nav component.
  late NavModel navModel;

  @override
  void initState(BuildContext context) {
    navModel = createModel(context, () => NavModel());
  }

  @override
  void dispose() {
    navModel.dispose();
  }
}
