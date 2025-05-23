import 'package:stackfood_multivendor_driver/common/widgets/custom_image_widget.dart';
import 'package:stackfood_multivendor_driver/feature/notification/domain/models/notification_model.dart';
import 'package:stackfood_multivendor_driver/util/dimensions.dart';
import 'package:stackfood_multivendor_driver/util/styles.dart';
import 'package:flutter/material.dart';

class NotificationDialogWidget extends StatelessWidget {
  final NotificationModel notificationModel;
  const NotificationDialogWidget({super.key, required this.notificationModel});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child:  SizedBox(
        width: 400,
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [

          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),

          Container(
            height: 150, width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radiusSmall), color: Theme.of(context).primaryColor.withValues(alpha: 0.20)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
              child: CustomImageWidget(
                image: '${notificationModel.imageFullUrl}',
                height: 150, width: MediaQuery.of(context).size.width, fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: Dimensions.paddingSizeLarge),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
            child: Text(
              notificationModel.title ?? '',
              style: robotoMedium.copyWith(color: Theme.of(context).primaryColor, fontSize: Dimensions.fontSizeLarge),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Text(
              notificationModel.description ?? '',
              style: robotoRegular.copyWith(color: Theme.of(context).disabledColor),
            ),
          ),

        ]),
      ),
    );
  }
}