import 'package:portfolio/data/model/project_info.dart';

class ShowcaseProject {
  final String title;
  final String image;
  final String shortDescription;
  final String description;
  final String heroTag;
  final ProjectInfo link;
  final ProjectInfo tags;
  final ProjectInfo tech;
  final ProjectInfo author;
  final ProjectInfo platform;
  final List<String>? images;
  final List<String>? mobileImages;

  ShowcaseProject(
      {required this.title,
      required this.heroTag,
      required this.image,
      required this.shortDescription,
      required this.description,
      required this.link,
      required this.tags,
      required this.tech,
      required this.author,
      required this.platform,
      this.images,
      this.mobileImages});
}
