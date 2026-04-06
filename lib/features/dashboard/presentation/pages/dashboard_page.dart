import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ztech_hpih_app/core/localization/l10n_extension.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:health_icons/health_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ztech_hpih_app/core/utils/constant.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/asset_helper.dart';
import '../../domain/models/dashboard_item.dart';
import '../widgets/feature_table.dart';

class DashBoardPage extends ConsumerStatefulWidget {
  const DashBoardPage({super.key});

  @override
  ConsumerState<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends ConsumerState<DashBoardPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isCollapsed = false;

  List<Map<String, dynamic>> listNoti = [
    {
      'descriptionKey': 'dashboard_important_notify_medicine_delivery',
      'url': 'https://hih.vn/',
      'isNew': true,
    },
    {
      'descriptionKey': 'dashboard_important_notify_online_visit',
      'url': 'https://hih.vn/',
    },
  ];
  List<Map<String, dynamic>> newServices = [
    {
      'titleKey': 'dashboard_service_customer_portal_title',
      'subtitleKey': 'dashboard_service_customer_portal_subtitle',
      'image':
          'https://img.freepik.com/free-photo/beautiful-young-female-doctor-looking-camera-office_1301-7807.jpg?semt=ais_rp_progressive&w=740&q=80',
    },
    {
      'titleKey': 'dashboard_service_quick_booking_title',
      'subtitleKey': 'dashboard_service_quick_booking_subtitle',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0pCwJuV_7SHriE0ay_CIzHTeTuk07U0BNhw&s',
    },
  ];
  List<Map<String, dynamic>> bannerItems = [
    {'image': AssetHelper.image('banner1.png'), 'url': 'https://hih.vn/'},
    {'image': AssetHelper.image('banner2.png'), 'url': 'https://hih.vn/'},
  ];
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 450 && !_isCollapsed) {
        setState(() => _isCollapsed = true);
      } else if (_scrollController.offset <= 450 && _isCollapsed) {
        setState(() => _isCollapsed = false);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: _isCollapsed ? Colors.white : AppTheme.primaryColor,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              CustomScrollView(
                controller: _scrollController,
                physics: const ClampingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Stack(
                      children: [
                        // Background xanh cố định
                        Container(
                          height: MediaQuery.of(context).size.height / 2.5,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppTheme.primaryColor,
                                AppTheme.secondaryColor,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                        ),
                        // Nội dung
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      l10n.dashboard_hospital_name,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      l10n.dashboard_hospital_city,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            _buildCarousel(),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: const FeatureTable(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(
                      top: 10,
                      left: 16,
                      right: 16,
                      bottom: 16,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        buildNewService(),
                        buildQuestionAnswer(),
                        buildNews(),
                        buildImportantNotify(),
                        buildNewPost(),
                        SizedBox(height: 50),
                      ]),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AnimatedSlide(
                  offset: Offset.zero,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.linear,
                  child: AnimatedOpacity(
                    opacity: _isCollapsed ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.linear,
                    child: Container(
                      color: Colors.white,
                      child: SafeArea(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha(20),
                                blurRadius: 8,
                                offset: const Offset(0, 8),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              for (final item in dashboardItems)
                                _buildCollapsedIcon(context, item),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (APP_VERSION == 0)
                Positioned(
                  bottom: 30,
                  left: MediaQuery.of(context).size.width * 0.25,
                  right: MediaQuery.of(context).size.width * 0.25,
                  child: GestureDetector(
                    onTap: () {
                      if (Platform.isAndroid) {
                        launchUrl(
                          Uri.parse(
                            'https://play.google.com/store/apps/details?id=com.ztech.hpih',
                          ),
                          mode: LaunchMode.externalApplication,
                        );
                      }
                      if (Platform.isIOS) {
                        launchUrl(
                          Uri.parse(
                            'https://apps.apple.com/vn/app/id6467622531',
                          ),
                          mode: LaunchMode.externalApplication,
                        );
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Cập nhật phiên bản mới',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarousel() {
    ScreenUtil.init(context);
    return CarouselSlider(
      items: bannerItems.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              width: 1.sw,
              child: GestureDetector(
                onTap: () => {
                  launchUrl(
                    Uri.parse(item['url'] ?? ''),
                    mode: LaunchMode.externalApplication,
                  ),
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: FadeInImage(
                    width: 1.sw,
                    fit: BoxFit.cover,
                    placeholder: AssetImage(AssetHelper.image('banner1.png')),
                    image: AssetImage(item['image'] ?? ''),
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        AssetHelper.image('banner1.png'),
                        width: 1.sw,
                      );
                    },
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),

      options: CarouselOptions(
        height: 0.35.sw,
        viewportFraction: 1,
        autoPlay: true,
      ),
    );
  }

  Widget _buildCollapsedIcon(BuildContext context, DashboardItem item) {
    return GestureDetector(
      onTap: item.hasRoute ? () => context.push(item.routePath) : null,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppTheme.primaryColor.withAlpha(20),
          shape: BoxShape.circle,
        ),
        child: Icon(item.icon, color: AppTheme.primaryColor, size: 20),
      ),
    );
  }

  Widget buildNewService() {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.dashboard_section_new_services,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff262A37),
          ),
        ),
        const SizedBox(height: 12),
        ...newServices.map(
          (service) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: ListTile(
                onTap: () {},
                contentPadding: const EdgeInsets.symmetric(horizontal: 6),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: FadeInImage(
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    image: NetworkImage(service['image']),
                    placeholder: AssetImage(AssetHelper.placeholder),
                  ),
                ),
                title: Text(
                  _resolveL10n(service['titleKey'], l10n),
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  _resolveL10n(service['subtitleKey'], l10n),
                  style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    IconsaxPlusLinear.arrow_right_3,
                    color: AppTheme.primaryColor,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildQuestionAnswer() {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          context.l10n.dashboard_question_screening_title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff262A37),
          ),
        ),
        ...questionAnswer.map(
          (question) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.10),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: ListTile(
                leading: Icon(
                  question['icon'],
                  color: AppTheme.primaryColor,
                  size: 20,
                ),
                title: Text(
                  _resolveL10n(question['titleKey'], l10n),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    IconsaxPlusLinear.arrow_right_3,
                    color: AppTheme.primaryColor,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildNews() {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          context.l10n.dashboard_news_category_title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff262A37),
          ),
        ),
        SizedBox(
          height: 130,
          child: ListView.builder(
            itemCount: news.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  width: 80,
                  height: 100,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(20),
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withAlpha(20),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          news[index]['icon'],
                          color: AppTheme.primaryColor,
                          size: 30,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _resolveL10n(news[index]['titleKey'], l10n),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildImportantNotify() {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          context.l10n.dashboard_important_notify_title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff262A37),
          ),
        ),
        const SizedBox(height: 12),
        ...listNoti.map(
          (noti) => Stack(
            children: [
              GestureDetector(
                onTap: () {
                  launchUrl(Uri.parse(noti['url']));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 4 * 3,
                  margin: const EdgeInsets.only(top: 12),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _resolveL10n(noti['descriptionKey'], l10n),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ),
              ),
              if (noti['isNew'] == true)
                Positioned(
                  top: 0,
                  left: 5,
                  child: Container(
                    width: 60,
                    height: 20,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          IconsaxPlusLinear.notification,
                          color: Colors.white,
                          size: 12,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          context.l10n.dashboard_new_badge,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildNewPost() {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          context.l10n.dashboard_latest_news_title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff262A37),
          ),
        ),
        ...newPosts.map(
          (post) => Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
            color: Colors.white,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FadeInImage(
                  width: 80,
                  height: 60,
                  fit: BoxFit.cover,
                  image: NetworkImage(post['image']),
                  placeholder: AssetImage(AssetHelper.placeholder),
                ),
              ),
              title: Text(
                _resolveL10n(post['titleKey'], l10n),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                post['date'],
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Map<String, dynamic>> questionAnswer = [
    {
      'titleKey': 'dashboard_screening_reproductive_health',
      'icon': HealthIcons.iScheduleSchoolDateTimeFilled,
    },
    {
      'titleKey': 'dashboard_screening_stroke',
      'icon': HealthIcons.iScheduleSchoolDateTimeFilled,
    },
  ];

  List<Map<String, dynamic>> news = [
    {
      'titleKey': 'dashboard_news_medical_services',
      'icon': HealthIcons.iScheduleSchoolDateTimeFilled,
    },
    {
      'titleKey': 'dashboard_news_hospital_activities',
      'icon': HealthIcons.iScheduleSchoolDateTimeFilled,
    },
    {
      'titleKey': 'dashboard_news_health_information',
      'icon': HealthIcons.iScheduleSchoolDateTimeFilled,
    },
    for (var i = 0; i < 12; i++)
      {
        'titleKey': 'dashboard_news_vaccine_center',
        'icon': HealthIcons.iScheduleSchoolDateTimeFilled,
      },
  ];
  List<Map<String, dynamic>> newPosts = [
    {
      'titleKey': 'dashboard_post_foreign_body_title',
      'image':
          'https://cdn2.tuoitre.vn/thumb_w/480/471584752817336320/2025/2/15/z6320157926804b67056d5f6d46e78825094928430171c-1739608232888203533536.jpg',
      'date': '15/02/2025',
    },
    {
      'titleKey': 'dashboard_post_rare_blood_title',
      'image':
          'https://cdn2.tuoitre.vn/thumb_w/480/471584752817336320/2025/2/15/z6320157926804b67056d5f6d46e78825094928430171c-1739608232888203533536.jpg',
      'date': '15/02/2025',
    },
    {
      'titleKey': 'dashboard_post_us_tourist_title',
      'image':
          'https://cdn2.tuoitre.vn/thumb_w/480/471584752817336320/2025/2/15/z6320157926804b67056d5f6d46e78825094928430171c-1739608232888203533536.jpg',

      'date': '15/02/2025',
    },
    {
      'titleKey': 'dashboard_post_practitioner_list_title',
      'image':
          'https://cdn2.tuoitre.vn/thumb_w/480/471584752817336320/2025/2/15/z6320157926804b67056d5f6d46e78825094928430171c-1739608232888203533536.jpg',
      'date': '15/02/2025',
    },
  ];

  String _resolveL10n(String key, dynamic l10n) {
    switch (key) {
      case 'dashboard_important_notify_medicine_delivery':
        return l10n.dashboard_important_notify_medicine_delivery;
      case 'dashboard_important_notify_online_visit':
        return l10n.dashboard_important_notify_online_visit;
      case 'dashboard_service_customer_portal_title':
        return l10n.dashboard_service_customer_portal_title;
      case 'dashboard_service_customer_portal_subtitle':
        return l10n.dashboard_service_customer_portal_subtitle;
      case 'dashboard_service_quick_booking_title':
        return l10n.dashboard_service_quick_booking_title;
      case 'dashboard_service_quick_booking_subtitle':
        return l10n.dashboard_service_quick_booking_subtitle;
      case 'dashboard_screening_reproductive_health':
        return l10n.dashboard_screening_reproductive_health;
      case 'dashboard_screening_stroke':
        return l10n.dashboard_screening_stroke;
      case 'dashboard_news_medical_services':
        return l10n.dashboard_news_medical_services;
      case 'dashboard_news_hospital_activities':
        return l10n.dashboard_news_hospital_activities;
      case 'dashboard_news_health_information':
        return l10n.dashboard_news_health_information;
      case 'dashboard_news_vaccine_center':
        return l10n.dashboard_news_vaccine_center;
      case 'dashboard_post_foreign_body_title':
        return l10n.dashboard_post_foreign_body_title;
      case 'dashboard_post_rare_blood_title':
        return l10n.dashboard_post_rare_blood_title;
      case 'dashboard_post_us_tourist_title':
        return l10n.dashboard_post_us_tourist_title;
      case 'dashboard_post_practitioner_list_title':
        return l10n.dashboard_post_practitioner_list_title;
      default:
        return key;
    }
  }
}
