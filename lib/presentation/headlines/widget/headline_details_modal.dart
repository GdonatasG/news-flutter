import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter/domain/articles/article.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

extension ArticleExtension on Article {
  void details({required BuildContext context}) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              maxChildSize: 0.8,
              minChildSize: 0.3,
              expand: false,
              builder: (context, scrollController) => ScrollConfiguration(
                    behavior: const ScrollBehavior().copyWith(overscroll: false),
                    child: ListView(
                      physics: const ClampingScrollPhysics(),
                      controller: scrollController,
                      children: [
                        CachedNetworkImage(
                          imageUrl: urlToImage,
                          width: MediaQuery.of(context).size.width,
                          height: 200.0,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(20.0)),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover)),
                          ),
                          placeholder: (context, _) => Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20.0)),
                                color: Colors.grey),
                            height: 200.0,
                          ),
                          errorWidget: (context, _, object) => Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20.0)),
                                color: Colors.grey),
                            height: 200.0,
                          ),
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 8.0),
                        _listItem(Text(title,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold))),
                        const SizedBox(height: 8.0),
                        _listItem(Row(
                          children: [
                            Flexible(
                              child: Row(
                                children: [
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Text(
                                      source,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    ),
                                  ),
                                  Text(
                                    " · $publishedAt",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            SizedBox(
                              height: 34,
                              width: 34,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(34),
                                onTap: () async {
                                  final Uri? uri = Uri.tryParse(url);
                                  if (uri == null) return;

                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(uri);
                                  }
                                },
                                child: const Icon(
                                  Icons.web,
                                  size: 20.0,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            SizedBox(
                              height: 34,
                              width: 34,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(34),
                                onTap: () {
                                  final Uri? uri = Uri.tryParse(url);
                                  if (uri == null) return;
                                  Share.shareUri(uri);
                                },
                                child: const Icon(Icons.share, size: 20.0),
                              ),
                            ),
                          ],
                        )),
                        const SizedBox(height: 4.0),
                        const Divider(height: 1.0),
                        const SizedBox(height: 12.0),
                        _listItem(Text(content)),
                        const SizedBox(height: 8.0)
                      ],
                    ),
                  ));
        });
  }

  Widget _listItem(Widget widget) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: widget,
    );
  }
}
