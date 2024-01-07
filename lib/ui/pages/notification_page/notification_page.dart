import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:kakar_news/data/utils/app_colors.dart';
import 'package:kakar_news/ui/widgets/app_textStyle.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);
  static const routeName = '/notificationPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Notification',
          style: buildTextStyle(
            color: AppColors.kBlack,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  faker.date.time(),
                  style: buildTextStyle(
                    color: AppColors.kBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColors.kSourcesBG,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 14,
                            ),
                            child: Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(35),
                                child: Image.network(
                                  faker.image.image(
                                    height: 70,
                                    width: 70,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  faker.person.name(),
                                  style: buildTextStyle(
                                    color: AppColors.kBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(' comment to your news “Minting Your First NFT: A... “',style: buildTextStyle(
                                  color: AppColors.kBlack,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),),
                                Text('1 h ago',style: buildTextStyle(
                                  color: AppColors.kGreyScale,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  faker.date.time(),
                  style: buildTextStyle(
                    color: AppColors.kBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColors.kSourcesBG,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 14,
                            ),
                            child: Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(35),
                                child: Image.network(
                                  faker.image.image(
                                    height: 70,
                                    width: 70,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  faker.person.name(),
                                  style: buildTextStyle(
                                    color: AppColors.kBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(' comment to your news “Minting Your First NFT: A... “',style: buildTextStyle(
                                  color: AppColors.kBlack,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),),
                                Text('1 h ago',style: buildTextStyle(
                                  color: AppColors.kGreyScale,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
