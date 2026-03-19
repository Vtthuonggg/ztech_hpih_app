class AllergyInfomationItem {
  final String title;
  final String routePath;

  AllergyInfomationItem({required this.title, required this.routePath});
}

List<AllergyInfomationItem> allergyInfomationItems = [
  AllergyInfomationItem(title: 'Tiền sử dị ứng', routePath: ''),
  AllergyInfomationItem(title: 'Dị ứng thực phẩm', routePath: ''),
  AllergyInfomationItem(title: 'Dị ứng thuốc', routePath: ''),
  AllergyInfomationItem(title: 'Dị ứng da', routePath: ''),
  AllergyInfomationItem(title: 'Dị ứng do môi trường', routePath: ''),
  AllergyInfomationItem(title: 'Các dị ứng khác', routePath: ''),
];
