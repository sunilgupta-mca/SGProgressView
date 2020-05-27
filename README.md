# SGProgressView
A simple code to add/remove loader view.
It supports iOS 11 and above.

**How to instasll:**

To install it, use below line in your podfile:
pod 'SGProgressView', '~> 1.0'

We can add loader on any UIControl which conforms to UIView.
If by mistake you call it more then once in a source view, in that case also it will add only once in a view.

**To Show Loader View: Use Below code to show loader view:**
1. ProgressIndicatorView.addLoadingView(sourceView: self.view, isTabBarView: false)
/* If you are showing loader on tabbar view controlller's view then pass true flag which will adjust appropriate bottom margin in tab bar. */

2. ProgressIndicatorView.addLoadingView(sourceView: self.view, isTabBarView: false, alpha: 0.25)

3. ProgressIndicatorView.addLoadingView(sourceView: self.view, withMessage: "Loading...", isTabBarView: false)

4. ProgressIndicatorView.addLoadingView(sourceView: self.view, withMessage: "Please wait...", isTabBarView: true, yAxisValue: 20 , alpha: 0.65)
/* Hear yAxisValue is CGFloat whilc will usefull for Margin from top while showing loader. */


**To Hide Loader View:Use Below code to hide loader view:**
1. ProgressIndicatorView.removeLoadingView(sourceView: self.view)

Feel free to use this solution in your code.
******Happy Coding******
