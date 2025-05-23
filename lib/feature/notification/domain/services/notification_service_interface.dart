abstract class NotificationServiceInterface {
  Future<dynamic> getNotificationList();
  void saveSeenNotificationCount(int count);
  int? getSeenNotificationCount();
  Future<dynamic> sendDeliveredNotification(int? orderID);
  List<int> getNotificationIdList();
  void addSeenNotificationIdList(List<int> notificationList);
}