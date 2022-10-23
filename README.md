# Nine News Stories

Nine News Stories is an iPhone app that consumes the provided API and displays a list of news articles to the user in a table view using `UIKit`. Tapping a story presents the asset URL in a `WKWebView`.

## Dependancies
There are no third party dependancies.

## Architecture

The architexture used is MVVM.
There are just two ViewModels, the `ArticlesViewModel`, and the `ArticleCellViewModel`.

## Requirements

1. The list of articles has a headline, the abstract, and the author by line.
2. The latest article is displayed first in the list.
3. Images are loaded asynchronously and cached.
4. The list of articles comes from this web service:
`https://bruce-v2-mob.fairfaxmedia.com.au/1/coding_test/13ZZQX/full`

## Unit Testing

As the codebase is small, there are just three tests being two unit tests, and a UI test.
The unit tests will test the ViewModels, and the UI test will test opening the first row in the table view and returning to the table view.

## Development

- Developed using Xcode 13.2.1 with Swift 5.
- Compiled with iOS 15.2.
