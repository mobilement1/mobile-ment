

// import 'dart:math' as math;
// import 'dart:ui';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:mobile_servies/admin/view/Booking/bookingpage.dart';
// import 'package:mobile_servies/admin/view/Dashbord/dashbord.dart';
// import 'package:mobile_servies/admin/view/Device/devicepage.dart';
// import 'package:mobile_servies/admin/view/Servicess/service.dart';
// import 'package:mobile_servies/admin/view/Technicianrequst/techniciarequst.dart';
// import 'package:mobile_servies/admin/view/Technicians/techician.dart';
// import 'package:mobile_servies/admin/view/completedoders/cmpltedorder.dart';

// // Singleton to persist FAB position
// class FabPositionManager {
//   static final FabPositionManager _instance = FabPositionManager._internal();
//   factory FabPositionManager() => _instance;
//   FabPositionManager._internal();

//   double? _fabX;
//   double? _fabY;

//   void setPosition(double x, double y) {
//     _fabX = x;
//     _fabY = y;
//   }

//   Offset getPosition() => Offset(_fabX ?? 0.0, _fabY ?? 0.0);

//   bool hasPosition() => _fabX != null && _fabY != null;
// }

// class DraggableFabMenu extends StatefulWidget {
//   final GlobalKey adminDashboardKey;
//   const DraggableFabMenu({Key? key, required this.adminDashboardKey}) : super(key: key);

//   @override
//   State<DraggableFabMenu> createState() => _DraggableFabMenuState();
// }

// class _DraggableFabMenuState extends State<DraggableFabMenu> with SingleTickerProviderStateMixin {
//   bool _isExpanded = false;
//   late AnimationController _animationController;
//   late Animation<double> _animation;
//   double _fabX = 0.0;
//   double _fabY = 0.0;
//   double _fabOpacity = 0.8;
//   bool _isDragging = false;
//   final FabPositionManager _positionManager = FabPositionManager();

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 300), // iOS-like duration
//       vsync: this,
//     );
//     _animation = CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOutCubic, // iOS-like springy curve
//     );

//     // Set initial FAB position
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final screenSize = MediaQuery.of(context).size;
//       final safeArea = MediaQuery.of(context).padding;
//       const fabSize = 56.0;
//       const margin = 16.0;

//       setState(() {
//         if (_positionManager.hasPosition()) {
//           final position = _positionManager.getPosition();
//           _fabX = position.dx;
//           _fabY = position.dy;
//         } else {
//           final RenderBox? renderBox = widget.adminDashboardKey.currentContext?.findRenderObject() as RenderBox?;
//           if (renderBox != null) {
//             final position = renderBox.localToGlobal(Offset.zero);
//             final size = renderBox.size;
//             _fabX = position.dx + size.width - fabSize - margin;
//             _fabY = position.dy + size.height - fabSize - safeArea.bottom - margin;
//           } else {
//             _fabX = screenSize.width - fabSize - safeArea.right - margin;
//             _fabY = screenSize.height - fabSize - safeArea.bottom - margin;
//           }

//           // Ensure FAB stays within safe screen boundaries
//           if (_fabX + fabSize > screenSize.width - safeArea.right) {
//             _fabX = screenSize.width - fabSize - safeArea.right - margin;
//           }
//           if (_fabY + fabSize > screenSize.height - safeArea.bottom) {
//             _fabY = screenSize.height - fabSize - safeArea.bottom - margin;
//           }
//           if (_fabX < safeArea.left) _fabX = safeArea.left + margin;
//           if (_fabY < safeArea.top) _fabY = safeArea.top + margin;

//           _positionManager.setPosition(_fabX, _fabY);
//         }
//       });
//     });

//     _startIdleAnimation();
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _startIdleAnimation() async {
//     while (mounted) {
//       await Future.delayed(const Duration(seconds: 3));
//       if (mounted && !_isExpanded && !_isDragging) {
//         setState(() {
//           _fabOpacity = 0.8;
//         });
//       }
//     }
//   }

//   void _toggleMenu() {
//     HapticFeedback.lightImpact();
//     setState(() {
//       _isExpanded = !_isExpanded;
//       _fabOpacity = 1.0;
//       if (_isExpanded) {
//         _animationController.forward();
//       } else {
//         _animationController.reverse();
//       }
//     });
//   }

//   void _navigateToPage(BuildContext context, Widget page) {
//     HapticFeedback.selectionClick();
//     _positionManager.setPosition(_fabX, _fabY);
//     Navigator.push(
//       context,
//       CupertinoPageRoute(builder: (context) => page),
//     );
//     _toggleMenu();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     final safeArea = MediaQuery.of(context).padding;
//     const menuSize = 280.0; 
//     const fabSize = 56.0;
//     double menuLeft = _fabX - (menuSize / 2) + (fabSize / 2);
//     double menuTop = _fabY - menuSize - 16 - safeArea.bottom;

//     if (menuLeft < safeArea.left + 16) menuLeft = safeArea.left + 16;
//     if (menuLeft + menuSize > screenSize.width - safeArea.right - 16) {
//       menuLeft = screenSize.width - menuSize - safeArea.right - 16;
//     }
//     if (menuTop < safeArea.top + 16) menuTop = _fabY + fabSize + 16;

//     return Stack(
//       children: [
//         if (_isExpanded)
//           Positioned.fill(
//             child: GestureDetector(
//               onTap: _toggleMenu,
//               child: Container(
//                 color: Colors.black.withOpacity(0.3),
//               ),
//             ),
//           ),
//         Positioned(
//           left: _fabX,
//           top: _fabY,
//           child: Draggable(
//             feedback: _buildFab(),
//             childWhenDragging: const SizedBox(),
//             onDragStarted: () {
//               HapticFeedback.mediumImpact();
//               setState(() {
//                 _isDragging = true;
//                 _fabOpacity = 1.0;
//               });
//             },
//             onDraggableCanceled: (velocity, offset) {
//               final screenSize = MediaQuery.of(context).size;
//               final safeArea = MediaQuery.of(context).padding;
//               const margin = 16.0;

//               setState(() {
//                 double newX = offset.dx;
//                 double newY = offset.dy;

//                 double distanceLeft = offset.dx - safeArea.left;
//                 double distanceRight = screenSize.width - safeArea.right - offset.dx - fabSize;
//                 double distanceTop = offset.dy - safeArea.top;
//                 double distanceBottom = screenSize.height - safeArea.bottom - offset.dy - fabSize;

//                 double minDistance = [
//                   distanceLeft,
//                   distanceRight,
//                   distanceTop,
//                   distanceBottom
//                 ].reduce((a, b) => a < b ? a : b);

//                 if (minDistance == distanceLeft) {
//                   newX = safeArea.left + margin;
//                 } else if (minDistance == distanceRight) {
//                   newX = screenSize.width - safeArea.right - fabSize - margin;
//                 } else if (minDistance == distanceTop) {
//                   newY = safeArea.top + margin;
//                 } else if (minDistance == distanceBottom) {
//                   newY = screenSize.height - safeArea.bottom - fabSize - margin;
//                 }

//                 _fabX = newX;
//                 _fabY = newY;
//                 _isDragging = false;
//                 _positionManager.setPosition(_fabX, _fabY);
//               });
//             },
//             child: _buildFab(),
//           ),
//         ),
//         if (_isExpanded)
//           Positioned(
//             left: menuLeft,
//             top: menuTop,
//             child: FadeTransition(
//               opacity: _animation,
//               child: ScaleTransition(
//                 scale: _animation,
//                 child: _buildExpandedMenu(context),
//               ),
//             ),
//           ),
//       ],
//     );
//   }

//   Widget _buildFab() {
//     return AnimatedOpacity(
//       opacity: _fabOpacity,
//       duration: const Duration(milliseconds: 300),
//       child: Container(
//         width: 56,
//         height: 56,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: CupertinoColors.systemGrey.withOpacity(0.2),
//           border: Border.all(
//             color: CupertinoColors.white.withOpacity(0.3),
//             width: 0.5,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: CupertinoColors.black.withOpacity(0.2),
//               blurRadius: 10,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Material(
//           color: Colors.transparent,
//           shape: const CircleBorder(),
//           child: InkWell(
//             onTap: _toggleMenu,
//             borderRadius: BorderRadius.circular(28),
//             child: const Icon(
//               CupertinoIcons.circle_filled,
//               color: CupertinoColors.white,
//               size: 30,
//               semanticLabel: 'Open menu',
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildExpandedMenu(BuildContext context) {
//     const double menuSize = 320.0;
//     const double radius = 110.0; 
//     final List<Map<String, dynamic>> menuItems = [
//       {
//         'label': 'Dashboard',
//         'icon': CupertinoIcons.square_grid_2x2,
//         'page':  Dashbordpage(),
//       },
//       {
//         'label': 'Bookings',
//         'icon': CupertinoIcons.calendar,
//         'page':  Bookingpage(),
//       },
//       {
//         'label': 'Completed',
//         'icon': CupertinoIcons.checkmark_circle,
//         'page':  Cmpltedorderpage(),
//       },
//       {
//         'label': 'Devices',
//         'icon': CupertinoIcons.device_phone_portrait,
//         'page':  Devicepage(),
//       },
//       {
//         'label': 'Services',
//         'icon': CupertinoIcons.wrench,
//         'page':  Servicepage(),
//       },
//       {
//         'label': 'Requests',
//         'icon': CupertinoIcons.person_add,
//         'page':  Techniciarequstpage(),
//       },
//       {
//         'label': 'Technicians',
//         'icon': CupertinoIcons.person_3,
//         'page':  Techicianpage(),
//       },
//     ];

//     return ClipRRect(
//       borderRadius: BorderRadius.circular(menuSize / 2),
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//         child: Container(
//           width: menuSize,
//           height: menuSize,
//           decoration: BoxDecoration(
//             color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
//             border: Border.all(
//               color: CupertinoColors.white.withOpacity(0.2),
//               width: 0.5,
//             ),
//           ),
//           child: Stack(
//             alignment: Alignment.center,
//             children: List.generate(menuItems.length, (index) {
//               final double angle = 2 * math.pi * index / menuItems.length - math.pi / 2; // Start from top
//               final double x = radius * math.cos(angle);
//               final double y = radius * math.sin(angle);

//               return Positioned(
//                 left: menuSize / 2 + x - 40, // Adjust for item size
//                 top: menuSize / 2 + y - 40,
//                 child: FadeTransition(
//                   opacity: _animation,
//                   child: ScaleTransition(
//                     scale: _animation,
//                     child: _buildMenuItem(
//                       context: context,
//                       label: menuItems[index]['label'],
//                       icon: menuItems[index]['icon'],
//                       page: menuItems[index]['page'],
//                     ),
//                   ),
//                 ),
//               );
//             }),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildMenuItem({
//     required BuildContext context,
//     required String label,
//     required IconData icon,
//     required Widget page,
//   }) {
//     return Container(
//       width: 70,
//       height: 70,
//       decoration: BoxDecoration(
        
//         color: CupertinoColors.systemGrey6.withOpacity(0.9),
//         borderRadius: BorderRadius.circular(15),
//         border: Border.all(
//           color: CupertinoColors.white.withOpacity(0.2),
//           width: 0.5,
//         ),
//       ),
//       child: Material(
//         color: Colors.transparent,
//         borderRadius: BorderRadius.circular(16),
//         child: InkWell(
//           onTap: () => _navigateToPage(context, page),
//           borderRadius: BorderRadius.circular(16),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 icon,
//                 color:  Color.fromARGB(255, 85, 105, 53),
//                 size: 24,
//               ),
//                SizedBox(height: 6),
//               Text(
//                 label,
//                 style: const TextStyle(
//                   fontFamily: 'SF Pro',
//                   color: CupertinoColors.label,
//                   fontSize: 12,
//                   fontWeight: FontWeight.w600,
//                 ),
//                 textAlign: TextAlign.center,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_servies/admin/view/Booking/bookingpage.dart';
import 'package:mobile_servies/admin/view/Dashbord/dashbord.dart';
import 'package:mobile_servies/admin/view/Device/devicepage.dart';
import 'package:mobile_servies/admin/view/Servicess/service.dart';
import 'package:mobile_servies/admin/view/Technicianrequst/techniciarequst.dart';
import 'package:mobile_servies/admin/view/Technicians/techician.dart';
import 'package:mobile_servies/admin/view/completedoders/cmpltedorder.dart';

// Singleton to persist FAB position
class FabPositionManager {
  static final FabPositionManager _instance = FabPositionManager._internal();
  factory FabPositionManager() => _instance;
  FabPositionManager._internal();

  double? _fabX;
  double? _fabY;

  void setPosition(double x, double y) {
    _fabX = x;
    _fabY = y;
  }

  Offset getPosition() => Offset(_fabX ?? 0.0, _fabY ?? 0.0);

  bool hasPosition() => _fabX != null && _fabY != null;
}

class DraggableFabMenu extends StatefulWidget {
  final GlobalKey adminDashboardKey;
  const DraggableFabMenu({Key? key, required this.adminDashboardKey}) : super(key: key);

  @override
  State<DraggableFabMenu> createState() => _DraggableFabMenuState();
}

class _DraggableFabMenuState extends State<DraggableFabMenu> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _animation;
  double _fabX = 0.0;
  double _fabY = 0.0;
  double _fabOpacity = 0.8;
  bool _isDragging = false;
  final FabPositionManager _positionManager = FabPositionManager();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300), // iOS-like duration
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutCubic, // iOS-like springy curve
    );

    // Set initial FAB position
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenSize = MediaQuery.of(context).size;
      final safeArea = MediaQuery.of(context).padding;
      const fabSize = 56.0;
      const margin = 16.0;

      setState(() {
        if (_positionManager.hasPosition()) {
          final position = _positionManager.getPosition();
          _fabX = position.dx;
          _fabY = position.dy;
        } else {
          final RenderBox? renderBox = widget.adminDashboardKey.currentContext?.findRenderObject() as RenderBox?;
          if (renderBox != null) {
            final position = renderBox.localToGlobal(Offset.zero);
            final size = renderBox.size;
            _fabX = position.dx + size.width - fabSize - margin;
            _fabY = position.dy + size.height - fabSize - safeArea.bottom - margin;
          } else {
            _fabX = screenSize.width - fabSize - safeArea.right - margin;
            _fabY = screenSize.height - fabSize - safeArea.bottom - margin;
          }

          // Ensure FAB stays within safe screen boundaries
          if (_fabX + fabSize > screenSize.width - safeArea.right) {
            _fabX = screenSize.width - fabSize - safeArea.right - margin;
          }
          if (_fabY + fabSize > screenSize.height - safeArea.bottom) {
            _fabY = screenSize.height - fabSize - safeArea.bottom - margin;
          }
          if (_fabX < safeArea.left) _fabX = safeArea.left + margin;
          if (_fabY < safeArea.top) _fabY = safeArea.top + margin;

          _positionManager.setPosition(_fabX, _fabY);
        }
      });
    });

    _startIdleAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startIdleAnimation() async {
    while (mounted) {
      await Future.delayed(const Duration(seconds: 3));
      if (mounted && !_isExpanded && !_isDragging) {
        setState(() {
          _fabOpacity = 0.8;
        });
      }
    }
  }

  void _toggleMenu() {
    HapticFeedback.lightImpact();
    setState(() {
      _isExpanded = !_isExpanded;
      _fabOpacity = 1.0;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  void _navigateToPage(BuildContext context, Widget page) {
    HapticFeedback.selectionClick();
    _positionManager.setPosition(_fabX, _fabY);
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => page),
    );
    _toggleMenu();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final safeArea = MediaQuery.of(context).padding;
    const menuWidth = 350.0; 
    const menuHeight = 250.0; 
    const fabSize = 56.0;
    double menuLeft = _fabX - (menuWidth / 2) + (fabSize / 2);
    double menuTop = _fabY - menuHeight - 16 - safeArea.bottom;

    if (menuLeft < safeArea.left + 16) menuLeft = safeArea.left + 16;
    if (menuLeft + menuWidth > screenSize.width - safeArea.right - 16) {
      menuLeft = screenSize.width - menuWidth - safeArea.right - 16;
    }
    if (menuTop < safeArea.top + 16) menuTop = _fabY + fabSize + 16;

    return Stack(
      children: [
        if (_isExpanded)
          Positioned.fill(
            child: GestureDetector(
              onTap: _toggleMenu,
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
        Positioned(
          left: _fabX,
          top: _fabY,
          child: Draggable(
            feedback: _buildFab(),
            childWhenDragging: const SizedBox(),
            onDragStarted: () {
              HapticFeedback.mediumImpact();
              setState(() {
                _isDragging = true;
                _fabOpacity = 1.0;
              });
            },
            onDraggableCanceled: (velocity, offset) {
              final screenSize = MediaQuery.of(context).size;
              final safeArea = MediaQuery.of(context).padding;
              const margin = 16.0;

              setState(() {
                double newX = offset.dx;
                double newY = offset.dy;

                double distanceLeft = offset.dx - safeArea.left;
                double distanceRight = screenSize.width - safeArea.right - offset.dx - fabSize;
                double distanceTop = offset.dy - safeArea.top;
                double distanceBottom = screenSize.height - safeArea.bottom - offset.dy - fabSize;

                double minDistance = [
                  distanceLeft,
                  distanceRight,
                  distanceTop,
                  distanceBottom
                ].reduce((a, b) => a < b ? a : b);

                if (minDistance == distanceLeft) {
                  newX = safeArea.left + margin;
                } else if (minDistance == distanceRight) {
                  newX = screenSize.width - safeArea.right - fabSize - margin;
                } else if (minDistance == distanceTop) {
                  newY = safeArea.top + margin;
                } else if (minDistance == distanceBottom) {
                  newY = screenSize.height - safeArea.bottom - fabSize - margin;
                }

                _fabX = newX;
                _fabY = newY;
                _isDragging = false;
                _positionManager.setPosition(_fabX, _fabY);
              });
            },
            child: _buildFab(),
          ),
        ),
        if (_isExpanded)
          Positioned(
            left: menuLeft,
            top: menuTop,
            child: FadeTransition(
              opacity: _animation,
              child: ScaleTransition(
                scale: _animation,
                child: _buildExpandedMenu(context),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildFab() {
    return AnimatedOpacity(
      opacity: _fabOpacity,
      duration: const Duration(milliseconds: 300),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: CupertinoColors.systemGrey.withOpacity(0.2),
          border: Border.all(
            color: CupertinoColors.white.withOpacity(0.3),
            width: 0.5,
          ),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          shape: const CircleBorder(),
          child: InkWell(
            onTap: _toggleMenu,
            borderRadius: BorderRadius.circular(28),
            child: const Icon(
              CupertinoIcons.circle_filled,
              color: CupertinoColors.white,
              size: 30,
              semanticLabel: 'Open menu',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedMenu(BuildContext context) {
    const double menuWidth = 350.0;
    const double menuHeight = 200.0;
    final List<Map<String, dynamic>> menuItems = [
      {
        'label': 'Dashboard',
        'icon': CupertinoIcons.square_grid_2x2,
        'page': Dashbordpage(),
      },
      {
        'label': 'Bookings',
        'icon': CupertinoIcons.calendar,
        'page': Bookingpage(),
      },
      {
        'label': 'Completed',
        'icon': CupertinoIcons.checkmark_circle,
        'page': Cmpltedorderpage(),
      },
      {
        'label': 'Devices',
        'icon': CupertinoIcons.device_phone_portrait,
        'page': Devicepage(),
      },
      {
        'label': 'Services',
        'icon': CupertinoIcons.wrench,
        'page': Servicepage(),
      },
      {
        'label': 'Requests',
        'icon': CupertinoIcons.person_add,
        'page': Techniciarequstpage(),
      },
      {
        'label': 'Technicians',
        'icon': CupertinoIcons.person_3,
        'page': Techicianpage(),
      },
    ];

    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: menuWidth,
          height: menuHeight,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
            border: Border.all(
              color: CupertinoColors.white.withOpacity(0.2),
              width: 0.5,
            ),
          ),
          child: GridView.count(
            crossAxisCount: 4,
            padding: const EdgeInsets.all(16.0),
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            children: List.generate(menuItems.length, (index) {
              return _buildMenuItem(
                context: context,
                label: menuItems[index]['label'],
                icon: menuItems[index]['icon'],
                page: menuItems[index]['page'],
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required BuildContext context,
    required String label,
    required IconData icon,
    required Widget page,
  }) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6.withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: CupertinoColors.white.withOpacity(0.2),
          width: 0.5,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: () => _navigateToPage(context, page),
          borderRadius: BorderRadius.circular(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: const Color.fromARGB(255, 85, 105, 53),
                size: 24,
              ),
              const SizedBox(height: 6),
              Text(
                label,
                style: const TextStyle(
                  fontFamily: 'SF Pro',
                  color: CupertinoColors.label,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}