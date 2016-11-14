# UIKevent

[![CI Status](http://img.shields.io/travis/Saulo Tauil/UIKevent.svg?style=flat)](https://travis-ci.org/Saulo Tauil/UIKevent)
[![Version](https://img.shields.io/cocoapods/v/UIKevent.svg?style=flat)](http://cocoapods.org/pods/UIKevent)
[![License](https://img.shields.io/cocoapods/l/UIKevent.svg?style=flat)](http://cocoapods.org/pods/UIKevent)
[![Platform](https://img.shields.io/cocoapods/p/UIKevent.svg?style=flat)](http://cocoapods.org/pods/UIKevent)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 8

## Installation

UIKevent is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "UIKevent"
```

## Usage

The controls supported are 
* UIBarButtonItem
* UIButton
* UISegmentedControl
* UIStepper
* UISlider
* UISwitch
* UIDatePicker

It is still required to import UIKevent. I recomend doing thins only in the AppDelegate.swift 
```swift 
import UIKevent
```


```swift
barButton.onClick {_ in
    print("BarButtonItem Clicked");
};

button.onClick { (btn) in
    print("Button clicked");
}

switchControl.onChange(handler: { ctrl in
    print("UISwitch changed");

})

slider.onChange { (sld) in
    print("slider change to \(sld.value)");
}

stepper.onChange { (obj) in
    print("stepper change to \(obj.value)");
}

segControll.onChange { (obj) in
    print("seg change to \(obj.selectedSegmentIndex)");
}
```



## Author

Saulo Tauil

## License

UIKevent is available under the MIT license. See the LICENSE file for more info.
