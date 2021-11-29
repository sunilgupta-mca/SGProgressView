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

![1](https://user-images.githubusercontent.com/65818613/83124688-274c5600-a0f4-11ea-93aa-273b2bdf6869.png)


2. ProgressIndicatorView.addLoadingView(sourceView: self.view, isTabBarView: false, alpha: 0.25)

![2](https://user-images.githubusercontent.com/65818613/83124842-5e226c00-a0f4-11ea-9eb8-4d546dc53aac.png)

3. ProgressIndicatorView.addLoadingView(sourceView: self.view, withMessage: "Loading...", isTabBarView: false)

![3](https://user-images.githubusercontent.com/65818613/83124883-68446a80-a0f4-11ea-8b2b-bc04d18113b5.png)

4. ProgressIndicatorView.addLoadingView(sourceView: self.view, withMessage: "Please wait...", isTabBarView: true, yAxisValue: 100 , alpha: 0.65)

/* Here yAxisValue is CGFloat whilc will usefull for Margin from top while showing loader. Here isTabBarView is true hence there will be some bottom margin (which is eqivalent to tab bar height) so that user can navigate to different tabs when loader is showing on any specific tab's viewcontroller.*/

![4](https://user-images.githubusercontent.com/65818613/83125885-b9a12980-a0f5-11ea-9454-fec582981721.png)


5. ProgressIndicatorView.addLoadingView(sourceView: customViewName,  withMessage: "fetching...", isTabBarView: true)

/* By using this code you can show loader on any specific view, hence user interaction will be enable on rest of the screen area.*/

![7](https://user-images.githubusercontent.com/65818613/83128609-47324880-a0f9-11ea-9e35-4d8d3a6a2586.png)


**To Hide Loader View:Use Below code to hide loader view:**
1. ProgressIndicatorView.removeLoadingView(sourceView: self.view)

/* It will remove the loader added on any particular view abnd then view looks orignal.*/

![6](https://user-images.githubusercontent.com/65818613/83129118-f40cc580-a0f9-11ea-91d3-c854065a6020.png)

Feel free to use this solution in your code.
******Happy Coding******
