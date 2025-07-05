import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/controller/providers/profile_provider.dart';
import 'package:mobile_servies/user/View/UserLogin/user_login.dart';
import 'package:mobile_servies/user/viewmodel/user_auth_provider.dart';
import 'package:provider/provider.dart';

class UserMenuPopup extends StatelessWidget {
  const UserMenuPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserAuthProvider, UserProfileProvider>(
      builder: (context, authProvider, profileProvider, child) {
        final userProfile = profileProvider.userProfile;
        final isLoading = profileProvider.isLoading;
        if (!isLoading && userProfile == null && profileProvider.errorMessage == null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            profileProvider.fetchUserProfile();
          });
        }

        return PopupMenuButton<int>(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          offset: const Offset(-160, 50),
          color: Colors.white,
          elevation: 12,
          icon: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF718355), Color(0xFF5A6B3F)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
               border: Border.all(color: Colors.white.withOpacity(0.2),width:2 ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.all(10),
            child: const Icon(Icons.person_2_outlined, color: Colors.white, size: 24),
          ),
          itemBuilder: (context) => [
            PopupMenuItem(
              
              enabled: false,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: AnimatedOpacity(
                opacity: isLoading ? 0.5 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: isLoading
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Color(0xFF718355),
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              userProfile?.name != null
                              ? '${userProfile!.name[0].toUpperCase()}${userProfile.name.substring(1).toLowerCase()}'
                              : 'No Name',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF0F3EC),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              userProfile?.role .toString()?? 'Unknown Role',
                              style: const TextStyle(
                                color: Color(0xFF6C7A45),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            const PopupMenuDivider(height: 1,),
            PopupMenuItem(
              value: 1,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDEDEC),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(Icons.logout, color: Colors.red, size: 20),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
          onSelected: (valueSelected) {
            if (valueSelected == 1) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    title: const Text(
                      'Confirm Logout',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    content: const Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.black54),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFDEDEC),
                          foregroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Logout'),
                        onPressed: () {
                          Navigator.pop(context);
                          authProvider.logoutUser();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => UserLogin()),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
        );
      },
    );
  }
}