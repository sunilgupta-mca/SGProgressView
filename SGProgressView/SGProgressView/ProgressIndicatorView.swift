//
//  ProgressIndicatorView.swift
//  SGProgressView
//
//  Created by Sunil Gupta on 26/05/20.
//  Copyright © 2020 Sunil Gupta. All rights reserved.
//

import UIKit

public class ProgressIndicatorView {
    // MARK: - initlizers declarations
    private init() { }
    
    // MARK: - Enumuration declaration
    /*!
     @typedef LoaderViewTags
     @brief A enum about the loading view componenet.
     @discussion This enum identified all the componenet of this view.
     @field loaderViewTag Container view with 50% transparancy.
     @field activityIndicatorViewTag Activity view placed at center of container view.
     @field messageLabelViewTag Label, which is used to show loading message if require.
     */
    private enum LoaderViewTags: Int {
        case loaderViewTag = -100
        case activityIndicatorViewTag = -101
        case messageLabelViewTag = -102
    }

    // MARK: - Static methods of class for adding loader view on the source view
    /*!
     @method addLoadingView
     @brief This method will add the loader view in the sourceView.
     @discussion This method will add only two components in the sourceView(i.e. loaderView, and activityIndicatorView).
     @param sourceView The input value representing the UIView value, in which view we are going to add the loader view.
     @param isTabBarView The input value representing the Boolean value, based on this we decide the loader view height for all devices.
     @return not return any value.
     */
    public static func addLoadingView(sourceView: UIView, isTabBarView: Bool, alpha: CGFloat = 0.5) {
        //Check if loader view is already added into sourceView and return if already added
        guard sourceView.viewWithTag(LoaderViewTags.loaderViewTag.rawValue) == nil else { return }

        // Set minimizeHeight for iPhoneX
        let minimizeHeight = ((Int(UIScreen.main.nativeBounds.size.height)) == 2436) ? (85) : (50)
        let loadingView = UIView(frame: CGRect(x: 0, y: 0, width: sourceView.frame.size.width, height: (sourceView.frame.size.height - CGFloat((isTabBarView ? minimizeHeight : 0)))))
        loadingView.backgroundColor = UIColor.black.withAlphaComponent(alpha)
        loadingView.tag = LoaderViewTags.loaderViewTag.rawValue

        //Add Activity Indicator
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.tag = LoaderViewTags.activityIndicatorViewTag.rawValue
        loadingView.addSubview(activityIndicator)
        activityIndicator.center = loadingView.center

        //Add loader in view
        sourceView.addSubview(loadingView)
        setConstraintsForLoaderView(parentView: sourceView, childView: loadingView)
        setConstraintsForLoaderViewComponents(parentView: loadingView, childView: activityIndicator, width: 37, height: 37)
        activityIndicator.startAnimating()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }

    /*!
     @method addLoadingView
     @brief This method will add the loader view in the sourceView.
     @discussion This method will add three components in the sourceView(i.e. loaderView, activityIndicatorView, and loading message).
     @param sourceView The input value representing the UIView value, in which view we are going to add the loader view.
     @param messageString The input value representing the String value, It contains the actual message which will display to user during loading time.
     @param isTabBarView The input value representing the Boolean value, based on this we decide the loader view height for all devices.
     @return not return any value.
     */
    public static func addLoadingView(sourceView: UIView, withMessage messageString: String?, isTabBarView: Bool, yAxisValue:CGFloat = 0, alpha: CGFloat = 0.5) {
        //Check if loader view is already added into sourceView and return if already added
        guard sourceView.viewWithTag(LoaderViewTags.loaderViewTag.rawValue)  == nil else { return }
        // Set minimizeHeight for iPhoneX
        let minimizeHeight = ((Int(UIScreen.main.nativeBounds.size.height)) == 2436) ? (85) : (50)
        let loadingView = UIView(frame: CGRect(x: 0, y: yAxisValue, width: sourceView.frame.size.width, height: (sourceView.frame.size.height - CGFloat((isTabBarView ? minimizeHeight : 0)) - yAxisValue)))
        loadingView.backgroundColor = UIColor.black.withAlphaComponent(alpha)
        loadingView.tag = LoaderViewTags.loaderViewTag.rawValue

        //Add Activity Indicator
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.tag = LoaderViewTags.activityIndicatorViewTag.rawValue
        loadingView.addSubview(activityIndicator)
        activityIndicator.center = loadingView.center
        activityIndicator.frame.origin.y -= (yAxisValue + 75) //Minus the y value as per message label height

        //Add Message label
        let messageLabel = UILabel(frame: CGRect(x: (sourceView.frame.size.width - 190)/2.0, y: activityIndicator.frame.origin.y + activityIndicator.frame.size.height, width: 200, height: 100))
        messageLabel.tag = LoaderViewTags.messageLabelViewTag.rawValue
        messageLabel.textAlignment = .center
        messageLabel.textColor = UIColor.white
        messageLabel.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.regular)
        messageLabel.text = messageString
        messageLabel.numberOfLines = 0
        messageLabel.lineBreakMode = .byWordWrapping
        messageLabel.backgroundColor = .clear
        loadingView.addSubview(messageLabel)

        //Add loader in view
        sourceView.addSubview(loadingView)
        setConstraintsForLoaderView(parentView: sourceView, childView: loadingView, topConstraintValue: yAxisValue)
        setConstraintsForLoaderViewComponents(parentView: loadingView, childView: activityIndicator, width: 37, height: 37, centerYConstraintValue: -25.0)
        setConstraintsForLoaderViewComponents(parentView: loadingView, childView: messageLabel, width: 200, height: 100, centerYConstraintValue: 25.0)
        activityIndicator.startAnimating()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }

    // MARK: - Static method for adding constraints in the parentView
    /*!
     @method setConstraintsForloaderView
     @brief This method will add the constraints in parent view.
     @discussion This method will add the leading, trailing, top, and bottom constrint to the parent view so that on rotaion of device the view will not clipped.
     @param parentView The input value representing the UIView value, which is sourceView and we are going to add the childView view in this view.
     @param childView The input value representing the UIView value, which is loader view.
     @param topConstraintValue The input value representing the CGFloat value, which will add as a constant value in topConstraint variable.
     @return not return any value.
     */
    private static func setConstraintsForLoaderView(parentView:UIView, childView:UIView, topConstraintValue:CGFloat = 0) {
        childView.translatesAutoresizingMaskIntoConstraints = false
        [childView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 0),
         childView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: 0),
         childView.topAnchor.constraint(equalTo: parentView.topAnchor, constant: topConstraintValue),
         childView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: 0)].forEach( {$0.isActive = true} )
    }

    /*!
     @method setConstraintsForLoaderViewComponents
     @brief This method will add the constraints in parent view.
     @discussion This method will add the centerX, centerY, width, and height constrint to the parent view so that on rotaion of device the view will stick to center of the screen.
     @param parentView The input value representing the UIView value, which is sourceView and we are going to add the childView view in this view.
     @param childView The input value representing the UIView value, which is loaderView's component.
     @param width The input value representing the CGFloat value, which will set the width of childView.
     @param height The input value representing the CGFloat value, which will set the height of childView.
     @param centerYConstraintValue The input value representing the CGFloat value, which will add as a constant value in centerYConstraint variable.
     @return not return any value.
     */
    private static func setConstraintsForLoaderViewComponents(parentView:UIView, childView:UIView, width:CGFloat, height:CGFloat, centerYConstraintValue:CGFloat = 0) {
        childView.translatesAutoresizingMaskIntoConstraints = false
        let centerXConstraint = NSLayoutConstraint(item: childView, attribute: .centerX, relatedBy: .equal, toItem: parentView, attribute: .centerX, multiplier: 1, constant: 0)
        let centerYConstraint = NSLayoutConstraint(item: childView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: parentView, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: centerYConstraintValue)
        let widthConstraint = NSLayoutConstraint(item: childView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: width)
        let heightConstraint =  NSLayoutConstraint(item: childView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: height)
        parentView.addConstraints([centerXConstraint, centerYConstraint, widthConstraint, heightConstraint])
    }

    // MARK: - Static method of class for removing the loader view on the source view
    /*!
     @method removeLoadingView
     @brief This method will remove the loader view from sourceView.
     @discussion This method will check the loader view availability in sourceView, and based on tag value if it founds the loading view then only the remove code will call.
     @param sourceView The input value representing the UIView value, from which view we are going to remove the loader view.
     @return not return any value.
     */
    public static func removeLoadingView(sourceView: UIView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        sourceView.subviews.forEach({ if ($0.tag == LoaderViewTags.loaderViewTag.rawValue) {
            $0.removeFromSuperview()
        }})
    }
}

