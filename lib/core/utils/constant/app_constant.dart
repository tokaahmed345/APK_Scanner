import 'dart:core';

class AppConstant {
  static   String getInitials(String? name, String email) {
    if (name != null && name.trim().isNotEmpty) {
      final nameParts = name.trim().split(' ');
      if (nameParts.length > 1 && nameParts[1].isNotEmpty) {
        return '${nameParts[0][0]}${nameParts[1][0]}'.toUpperCase();
      } else if (nameParts[0].isNotEmpty) {
        return nameParts[0][0].toUpperCase();
      }
    }
    return email.isNotEmpty ? email[0].toUpperCase() : 'U';
  }

}