import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_flutter/domain/articles/article.dart';
import 'package:news_flutter/presentation/widgets/app_progress_indicator.dart';

class PagedHeadlinesList extends StatelessWidget {
  const PagedHeadlinesList(
      {super.key,
      required this.pagingController,
      required this.onItemClick,
      this.sliver = false});

  final PagingController<int, Article> pagingController;
  final Function(Article) onItemClick;
  final bool sliver;

  @override
  Widget build(BuildContext context) {
    return sliver
        ? PagedSliverList<int, Article>.separated(
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate<Article>(
              itemBuilder: (context, item, index) => _headline(context, item),
              firstPageProgressIndicatorBuilder: (context) =>
                  _firstPageProgressIndicator(),
              firstPageErrorIndicatorBuilder: (context) =>
                  _firstPageErrorIndicator(),
              noItemsFoundIndicatorBuilder: (context) =>
                  _noItemsFoundIndicator(),
              newPageProgressIndicatorBuilder: (context) =>
                  _newPageProgressIndicator(),
              newPageErrorIndicatorBuilder: (context) =>
                  _newPageErrorIndicator(),
            ),
            separatorBuilder: (context, index) => _separator(index),
          )
        : PagedListView<int, Article>.separated(
            pagingController: pagingController,
            physics: const BouncingScrollPhysics(),
            builderDelegate: PagedChildBuilderDelegate<Article>(
              itemBuilder: (context, item, index) => _headline(context, item),
              firstPageProgressIndicatorBuilder: (context) =>
                  _firstPageProgressIndicator(),
              firstPageErrorIndicatorBuilder: (context) =>
                  _firstPageErrorIndicator(),
              noItemsFoundIndicatorBuilder: (context) =>
                  _noItemsFoundIndicator(),
              newPageProgressIndicatorBuilder: (context) =>
                  _newPageProgressIndicator(),
              newPageErrorIndicatorBuilder: (context) =>
                  _newPageErrorIndicator(),
            ),
            separatorBuilder: (context, index) => _separator(index));
  }

  Widget _firstPageProgressIndicator() => const Center(
        child: AppProgressIndicator(),
      );

  Widget _firstPageErrorIndicator() => Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              const Expanded(
                  child: Center(
                child: Text(
                  "Unable to load articles, please try again!",
                  textAlign: TextAlign.center,
                ),
              )),
              const SizedBox(height: 24.0),
              FilledButton(
                  onPressed: () {
                    pagingController.refresh();
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Retry")],
                  ))
            ],
          ),
        ),
      );

  Widget _noItemsFoundIndicator() => Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              const Expanded(
                  child: Center(
                child: Text(
                  "No articles found :(",
                  textAlign: TextAlign.center,
                ),
              )),
              const SizedBox(height: 24.0),
              FilledButton(
                  onPressed: () {
                    pagingController.refresh();
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Refresh")],
                  ))
            ],
          ),
        ),
      );

  Widget _newPageErrorIndicator() => InkWell(
        onTap: () {
          pagingController.retryLastFailedRequest();
        },
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                Text("Unable to load more articles. Tap to retry."),
                SizedBox(height: 4.0),
                Icon(Icons.refresh, size: 16.0)
              ],
            ),
          ),
        ),
      );

  Widget _separator(int index) =>
      index < ((pagingController.value.itemList?.length ?? 0)) - 1
          ? const Divider()
          : Container();

  Widget _newPageProgressIndicator() => const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: AppProgressIndicator(),
        ),
      );

  Widget _headline(BuildContext context, Article article) {
    return InkWell(
      onTap: () {
        onItemClick(article);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage,
                width: MediaQuery.of(context).size.width,
                height: 200.0,
                placeholder: (context, _) => Container(
                  height: 200.0,
                  color: Colors.grey,
                ),
                errorWidget: (context, _, object) => Container(
                  height: 200.0,
                  color: Colors.grey,
                ),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(article.title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    article.source,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                Text(
                  " · ${article.publishedAt}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
