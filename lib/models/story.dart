class Story {
  final String id;
  final String ownerName;
  final String avatarEmoji;
  final List<String>
  pages; // simple text pages; could be image urls if available

  Story({
    required this.id,
    required this.ownerName,
    required this.avatarEmoji,
    required this.pages,
  });
}
