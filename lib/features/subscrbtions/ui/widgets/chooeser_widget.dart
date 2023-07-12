import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naz_gem/features/subscrbtions/ui/get/subscrbtions_getx_controller.dart';

class ChooeserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscrbtionGetxController>(
      builder: (controller) {
        return Row(
          children: [
            Expanded(
              child: RadioListTile(
                value: 0,
                groupValue: controller.groupValue,
                onChanged: (val) {
                  controller.changeGroupValue(value: val!);
                    // groupValue = val!;

                },
                title: Text('yes'.tr),
              ),
            ),
            Expanded(
              child: RadioListTile(
                value: 1,
                groupValue: controller.groupValue,
                onChanged: (val) {
                  controller.changeGroupValue(value: val!);
                    // groupValue = val!;
                },
                title: Text('no'.tr),
              ),
            ),
          ],
        );
      }
    );
  }
}
