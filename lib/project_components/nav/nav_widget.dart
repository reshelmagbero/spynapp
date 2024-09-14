import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_model.dart';
export 'nav_model.dart';

class NavWidget extends StatefulWidget {
  const NavWidget({super.key});

  @override
  State<NavWidget> createState() => _NavWidgetState();
}

class _NavWidgetState extends State<NavWidget> {
  late NavModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 76.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(26.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 20.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.home,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
              onPressed: () async {
                context.goNamed('ProjectDashboard');
              },
            ),
            Stack(
              alignment: AlignmentDirectional(0.0, 0.0),
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 20.0,
                  buttonSize: 60.0,
                  icon: FaIcon(
                    FontAwesomeIcons.paste,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.goNamed('null');
                  },
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 24.0),
                  child: Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      shape: BoxShape.circle,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        '2',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).info,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 20.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.person,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed('Profile');
              },
            ),
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 20.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.chat_outlined,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
              onPressed: () async {
                context.goNamed('Chat');
              },
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 50.0,
                buttonSize: 54.0,
                fillColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.add_circle_outlined,
                  color: FlutterFlowTheme.of(context).alternate,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pushNamed('CreateProject');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
