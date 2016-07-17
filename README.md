# XZMessageView

[![CI Status](http://img.shields.io/travis/tringappsXiZhang/XZMessageView.svg?style=flat)](https://travis-ci.org/tringappsXiZhang/XZMessageView)
[![Version](https://img.shields.io/cocoapods/v/XZMessageView.svg?style=flat)](http://cocoapods.org/pods/XZMessageView)
[![License](https://img.shields.io/cocoapods/l/XZMessageView.svg?style=flat)](http://cocoapods.org/pods/XZMessageView)
[![Platform](https://img.shields.io/cocoapods/p/XZMessageView.svg?style=flat)](http://cocoapods.org/pods/XZMessageView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

XZMessageView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "XZMessageView"
```

## Author

Xi Zhang, chaucyzhang@gmail.com

## License

XZMessageView is available under the MIT license. See the LICENSE file for more info.
=======
# XZMessageView

##API Example:

##Initilize XZMessageView: 
```
XZMessageView *messageView = [[XZMessageView alloc] initWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 44.0)];
```

##Display message:
```
[messageView displayErrorMsgViewWithText:@"msg"];
```


##Customize message:

you can also customize the message background color/font/font color/animation duration/message auto hide delay:

```
[messageView setBgColor:[UIColor redColor]];

[messageView setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:17.0]];

[messageView setFontColor:[UIColor blueColor]];

[messageView setAnimationDuration:4.0];

[messageView setAutoHideDelay:10.0];
```








