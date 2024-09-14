import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar_floting_model.dart';
export 'nav_bar_floting_model.dart';

class NavBarFlotingWidget extends StatefulWidget {
  const NavBarFlotingWidget({super.key});

  @override
  State<NavBarFlotingWidget> createState() => _NavBarFlotingWidgetState();
}

class _NavBarFlotingWidgetState extends State<NavBarFlotingWidget> {
  late NavBarFlotingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarFlotingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 70.0,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 12.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                5.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 2.0,
              sigmaY: 2.0,
            ),
            child: Container(
              width: double.infinity,
              height: 77.0,
              decoration: BoxDecoration(
                color: Color(0xDBFFFFFF),
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(14.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 49.0,
                      icon: FaIcon(
                        FontAwesomeIcons.home,
                        color: Color(0xCAE41253),
                        size: 25.0,
                      ),
                      onPressed: () async {
                        context.pushNamed('ProjectDashboard');
                      },
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.edit_calendar,
                        color: Color(0xFF3F3F3F),
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.pushNamed('null');
                      },
                    ),
                    Container(
                      width: 75.0,
                      height: 75.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).primary,
                            Color(0xCAE41253)
                          ],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.34, -1.0),
                          end: AlignmentDirectional(-0.34, 1.0),
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 0.0,
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 25.0,
                        ),
                        onPressed: () async {
                          context.pushNamed(
                            'CreateProject',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 500),
                              ),
                            },
                          );
                        },
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 63.0,
                      icon: Icon(
                        Icons.chat_outlined,
                        color: Color(0xFF3F3F3F),
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.pushNamed('Chat');
                      },
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 52.0,
                      icon: Icon(
                        Icons.person_outline,
                        color: Color(0xFF3F3F3F),
                        size: 30.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
