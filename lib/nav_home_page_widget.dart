import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'nav_home_page_model.dart';
export 'nav_home_page_model.dart';

class NavHomePageWidget extends StatefulWidget {
  const NavHomePageWidget({super.key});

  static String routeName = 'nav_HomePage';
  static String routePath = '/navHomePage';

  @override
  State<NavHomePageWidget> createState() => _NavHomePageWidgetState();
}

class _NavHomePageWidgetState extends State<NavHomePageWidget> {
  late NavHomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavHomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Widget _buildCard({
    required BuildContext context,
    required String clientName,
    required String initials,
    required String formula,
    required String timestamp,
    required Color badgeColor,
    required Color badgeBg,
    required Color avatarBg,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 16,
              color: Color(0x14000000),
              offset: Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          clientName,
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Inter',
                                    color: const Color(0xFF1A1A2E),
                                    fontSize: 16,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          decoration: BoxDecoration(
                            color: badgeBg,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8, 4, 8, 4),
                            child: Text(
                              formula,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    color: badgeColor,
                                    fontSize: 12,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: avatarBg,
                      shape: BoxShape.circle,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          initials,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: badgeColor,
                                    fontSize: 14,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      color: Color(0xFF8A94A6),
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      clientName,
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily:
                                'Inter', // <--- Solo el nombre entre comillas
                            color: const Color(0xFF8A94A6),
                            fontSize: 12,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton({
    required BuildContext context,
    required Widget icon,
    required VoidCallback onPressed,
    required Color bgColor,
    required List<Shadow> shadows,
  }) {
    return Container(
      width: 53.2,
      height: 53.17,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Align(
        alignment: AlignmentDirectional.center,
        child: FFButtonWidget(
          onPressed: onPressed,
          text: '',
          icon: icon,
          options: FFButtonOptions(
            height: 50,
            padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
            iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            color: bgColor,
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontSize: 12,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  shadows: shadows,
                ),
            elevation: 0,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            // ── Main scrollable content ──────────────────────────────────
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Top spacer
                  const SizedBox(height: 60),

                  // ── Header: logo + title ───────────────────────────────
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                clipBehavior: Clip.antiAlias,
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                child: Image.asset(
                                  'assets/images/vortice-removebg-preview.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                'Chromatix',
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: const Color(0xFF1A1A2E),
                                      fontSize: 36,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            'Tu asistente de colorimetría',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: const Color(0xFF8A94A6),
                                  fontSize: 14,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ── Action buttons ─────────────────────────────────────
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // Nuevo Diagnóstico
                        FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('');
                          },
                          text: 'Nuevo Diagnóstico',
                          icon: const Icon(
                            Icons.star_rounded,
                            size: 20,
                            color: Colors.black,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 148.7,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24, 0, 24, 0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 0),
                            iconColor: const Color.fromARGB(255, 0, 0, 0),
                            color: const Color(0xFFF6D860),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 16,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Calculadora Libre
                        FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('');
                          },
                          text: 'Calculadora Libre',
                          icon: const Icon(
                            Icons.calculate_outlined,
                            size: 20,
                            color: Colors.black,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 56,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24, 0, 24, 0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 0),
                            iconColor: const Color.fromARGB(255, 0, 0, 0),
                            color: Colors.white,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 16,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                            elevation: 0,
                            borderSide: const BorderSide(
                              color: Color(0xFFE2E8F0),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ── Recent works ───────────────────────────────────────
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Trabajos Recientes',
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Readex Pro',
                                color: const Color(0xFF1A1A2E),
                                fontSize: 20,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 12),
                        ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          children: [
                            _buildCard(
                              context: context,
                              clientName: 'Valentina Torres',
                              initials: 'VT',
                              formula: '9.0 + 30 Vol (1:2)',
                              timestamp: 'Hace 5 horas',
                              badgeColor: const Color(0xFF4A6CF7),
                              badgeBg: const Color(0xFFF0F4FF),
                              avatarBg: const Color(0xFFE8EEFF),
                            ),
                            _buildCard(
                              context: context,
                              clientName: 'Camila Restrepo',
                              initials: 'CR',
                              formula: '7.5 + 20 Vol (1:1)',
                              timestamp: 'Ayer, 3:30 PM',
                              badgeColor: const Color(0xFF2D7D46),
                              badgeBg: const Color(0xFFF0FFF4),
                              avatarBg: const Color(0xFFE6F9EE),
                            ),
                            _buildCard(
                              context: context,
                              clientName: 'Sofía Mendoza',
                              initials: 'SM',
                              formula: '10.0 + 40 Vol (1:2)',
                              timestamp: 'Ayer, 11:00 AM',
                              badgeColor: const Color(0xFFC53030),
                              badgeBg: const Color(0xFFFFF5F5),
                              avatarBg: const Color(0xFFFFE8E8),
                            ),
                            _buildCard(
                              context: context,
                              clientName: 'Valentina Torres',
                              initials: 'VT',
                              formula: '9.0 + 30 Vol (1:2)',
                              timestamp: 'Hace 5 horas',
                              badgeColor: const Color(0xFF4A6CF7),
                              badgeBg: const Color(0xFFF0F4FF),
                              avatarBg: const Color(0xFFE8EEFF),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Bottom spacer so content clears the nav bar
                  const SizedBox(height: 120),
                ],
              ),
            ),

            // ── Floating Navigation Bar ──────────────────────────────────
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10,
                        color: Color(0x1A000000),
                        offset: Offset(0, 3),
                        spreadRadius: 15,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Home (active)
                        Expanded(
                          child: _buildNavButton(
                            context: context,
                            icon: const Icon(
                              Icons.home_outlined,
                              size: 26,
                              color: Colors.black,
                            ),
                            bgColor: const Color(0xFFF6D860),
                            shadows: const [
                              Shadow(
                                color: Color(0xFFB3B3B3),
                                offset: Offset(2.0, 2.0),
                                blurRadius: 10.0,
                              ),
                            ],
                            onPressed: () async {
                              context.pushNamed('NavHomePageWidget');
                            },
                          ),
                        ),

                        // Clients
                        Expanded(
                          child: _buildNavButton(
                            context: context,
                            icon: const Icon(
                              Icons.people_outlined,
                              size: 26,
                              color: Colors.black,
                            ),
                            bgColor: const Color(0x00F6D860),
                            shadows: [
                              Shadow(
                                color: FlutterFlowTheme.of(context).primaryText,
                                offset: const Offset(2.0, 2.0),
                                blurRadius: 10.0,
                              ),
                            ],
                            onPressed: () async {
                              context.pushNamed('DiagStep3HistorialWidget');
                            },
                          ),
                        ),

                        // Calculator (BAJADO A 26 TAMBIÉN)
                        Expanded(
                          child: _buildNavButton(
                            context: context,
                            icon: const FaIcon(
                              FontAwesomeIcons.calculator,
                              size: 26,
                              color: Colors.black,
                            ),
                            bgColor: const Color(0x00F6D860),
                            shadows: const [
                              Shadow(
                                color: Color(0xFFB3B3B3),
                                offset: Offset(2.0, 2.0),
                                blurRadius: 10.0,
                              ),
                            ],
                            onPressed: () async {
                              context.pushNamed('');
                            },
                          ),
                        ),

                        // Inventory
                        Expanded(
                          child: _buildNavButton(
                            context: context,
                            icon: const FaIcon(
                              FontAwesomeIcons.boxOpen,
                              size: 26,
                              color: Colors.black,
                            ),
                            bgColor: const Color(0x00F6D860),
                            shadows: const [
                              Shadow(
                                color: Color(0xFFB3B3B3),
                                offset: Offset(2.0, 2.0),
                                blurRadius: 10.0,
                              ),
                            ],
                            onPressed: () {},
                          ),
                        ),

                        // Settings
                        Expanded(
                          child: _buildNavButton(
                            context: context,
                            icon: const FaIcon(
                              FontAwesomeIcons.gears,
                              size: 26,
                              color: Colors.black,
                            ),
                            bgColor: const Color(0x00F6D860),
                            shadows: const [
                              Shadow(
                                color: Color(0xFFB3B3B3),
                                offset: Offset(2.0, 2.0),
                                blurRadius: 10.0,
                              ),
                            ],
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
