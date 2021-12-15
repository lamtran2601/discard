List<String> getHashtags(String text) => RegExp(r"\#(\w+)")
    .allMatches(text)
    .where((match) => match.group(1)?.isNotEmpty ?? false)
    .map((match) => match.group(1)!)
    .toList();

String getFileNameFromPath(String path) => path.split('/').last;
