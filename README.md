
![LIHAlert](https://lh3.googleusercontent.com/-XYNO10zaN6M/WK0u2-4KViI/AAAAAAAACxk/aIM1p900FP8HU_hs9e639HgWdikC6OL5wCEw/h218/lihalert_anner.jpg)

# LIHAlert

#####LIHAlert provides animated banners for iOS.
#####Updated to Swift 3

![general](https://cloud.githubusercontent.com/assets/12048316/23353851/8814f5d4-fcf4-11e6-9e83-94a7f5c0e822.gif)
![custom](https://cloud.githubusercontent.com/assets/12048316/23353847/880ab1dc-fcf4-11e6-8756-11e7a4cc70bd.gif)

[![CI Status](http://img.shields.io/travis/Lasith Hettiarachchi/LIHAlert.svg?style=flat)](https://travis-ci.org/Lasith Hettiarachchi/LIHAlert)
[![Version](https://img.shields.io/cocoapods/v/LIHAlert.svg?style=flat)](http://cocoapods.org/pods/LIHAlert)
[![License](https://img.shields.io/cocoapods/l/LIHAlert.svg?style=flat)](http://cocoapods.org/pods/LIHAlert)
[![Platform](https://img.shields.io/cocoapods/p/LIHAlert.svg?style=flat)](http://cocoapods.org/pods/LIHAlert)



###Demo Project
The LIHAlert workspace contains a demo project, also used for developments.

### Requirements
Xcode 7+

### Installation

LIHAlert is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "LIHAlert"
```

or

Copy the LIHAlert folder into your project.



For the swift 2 version
```ruby
pod 'LIHAlert', '~> 1.1.0'
```


### Usage

Import the module using
```Swift
    import LIHAlert
```

To run the example project, clone the repo, and run `pod install` from the Example directory first.

#### Templates
LIHAlert contains some predefined alert templates for each Alert type. 
* Text Alert
* Success alert
* Error alert 
* Text with a title 
* Processing Alert (Text with an ActivityIndicator)
* Text with a button
* Text with two buttons
* Custom view banner (also used to embed view controllers)

You can use following code snippets to use them. 

#####1. Text Banner
![text](https://cloud.githubusercontent.com/assets/12048316/23353834/7c72d1c4-fcf4-11e6-9475-32bb4fc31ad6.gif)

```Swift
    var textAlert: LIHAlert?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textAlert = LIHAlertManager.getTextAlert("Sample Message")
        self.textAlert?.initAlert(self.view)
    }
    func showBanner(sender: AnyObject) {
        self.textAlert?.show(nil, hidden: nil)
    }
```
Call showBanner() function to show the banner



#####2. Success Alert
![success](https://cloud.githubusercontent.com/assets/12048316/23353849/8811738c-fcf4-11e6-84c3-b9c51c4cc60a.gif)

```Swift
var successAlert: LIHAlert?
override func viewDidLoad() {
    super.viewDidLoad()
    self.successAlert = LIHAlertManager.getSuccessAlert(message: "Successfully subscribed")
    self.successAlert?.initAlert(self.view)
}
func showBanner(sender: AnyObject) {
    self.successAlert?.show(nil, hidden: nil)
}
```

To change the icon,
```Swift
    successAlert?.icon = UIImage(named:"imageName")
```



#####3. Error Alert
![error](https://cloud.githubusercontent.com/assets/12048316/23353848/880d199a-fcf4-11e6-934e-4ecd9cfc506f.gif)

```Swift
var errorAlert: LIHAlert?
override func viewDidLoad() {
    super.viewDidLoad()
    self.errorAlert = LIHAlertManager.getErrorAlert(message: "Failed. Please try again")
    self.errorAlert?.initAlert(self.view)
}
func showBanner(sender: AnyObject) {
    self.errorAlert?.show(nil, hidden: nil)
}
```

To change the icon,
```Swift
    successAlert?.icon = UIImage(named:"imageName")
```



#####4. Text with title
![textwithtitle](https://cloud.githubusercontent.com/assets/12048316/23353855/88660276-fcf4-11e6-8cf5-8ec076104ee9.gif)

```Swift
    var textWithTitleAlert: LIHAlert?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textWithTitleAlert = LIHAlertManager.getTextWithTitleAlert("This is The Title", message: "This is a sample message.")
        self.textWithTitleAlert?.initAlert(self.view)
    }
    func showBanner(sender: AnyObject) {
        self.textWithTitleAlert?.show(nil, hidden: nil)
    }
```



#####5. Loading Alert

This is a banner with a text and an activity indicator. This is not an auto close banner. You have to hide it when the process is finished.

![processing](https://cloud.githubusercontent.com/assets/12048316/23353852/8817c232-fcf4-11e6-821c-6c2b9351bed7.gif)

```Swift
    var processingAlert: LIHAlert?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.processingAlert = LIHAlertManager.getProcessingAlert("Fetching data...")
        self.processingAlert?.initAlert(self.view)
    }
    func showBanner(sender: AnyObject) {
        self.processingAlert?.show(nil, hidden: nil)
    }
    override hideBanner(sender: AnyObject) {
        self.processingAlert?.hide(nil)
    }
```
Call showBanner() function to show the banner and hideBanner() to hide the banner.
To change the activity indicator style,
```Swift
    processingAlert?.activityIndicatorStyle = UIActivityIndicatorViewStyle.WhiteLarge
```



#####6. Text with a button Alert
This alert contains a button along with a text. More suitable for notifying important messages to user.
![withbutton](https://cloud.githubusercontent.com/assets/12048316/23353856/886cba3a-fcf4-11e6-8f31-39be41e0d3a1.gif)

```Swift
    var textWithButtonAlert: LIHAlert?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textWithButtonAlert = LIHAlertManager.getTextWithButtonAlert("You have successfully subscribed for the monthly newsletter", buttonText: "Dismiss")
        self.textWithButtonAlert?.initAlert(self.view)
    }
    func showBanner(sender: AnyObject) {
        textWithButtonAlert?.show(nil, hidden: nil)
    }
```
Call showBanner() function to show the banner. 
Implement LIHAlertDelegate for button click events.

```Swift
class ViewController: LIHAlertDelegate {
    func buttonPressed(button: UIButton) {
        print(“You have pressed the button”)
        self.textWithButtonAlert?.hideAlert(nil)
    }
}
```



#####7. Text with two buttons Alert
This alert contains two buttons along with a text.

![twobuttons](https://cloud.githubusercontent.com/assets/12048316/23353857/8871f068-fcf4-11e6-9975-5e174296327b.gif)

```Swift
    var textWithTwoButtonsAlert: LIHAlert?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textWithTwoButtonsAlert = LIHAlertManager.getTextWithTwoButtonsAlert("Do you want to subscribe for the monthly newsletter?", buttonOneText: "Subscribe", buttonTwoText: "Cancel")
        self.textWithTwoButtonsAlert?.initAlert(self.view)
    }
    func showBanner(sender: AnyObject) {
        textWithTwoButtonsAlert?.show(nil, hidden: nil)
    }
```
Call showBanner() function to show the banner. 
Implement LIHAlertDelegate for button click events.

```Swift
class ViewController: LIHAlertDelegate {
    func buttonOnePressed(button: UIButton) {
        self.textWithTwoButtonsAlert?.hideAlert({ () -> () in
            self.successAlert?.show(nil, hidden: nil)
        })
    }
    func buttonTwoPressed(button: UIButton) {
        self.textWithTwoButtonsAlert?.hideAlert(nil)
    }
}
```



#####8. Custom View Alert
You can specify any view to act as the banner.

![customview](https://cloud.githubusercontent.com/assets/12048316/23353846/87e36884-fcf4-11e6-9349-542ed94452c8.gif)

```Swift
    var customViewAlert: LIHAlert?

    override func viewDidLoad() {
        super.viewDidLoad()
    //In this case I am using an ImageView as the banner
        let customView = UIImageView(frame: CGRectMake(0.0, 64.0, 100, 50))
        customView.image = UIImage(named: "customViewImage")
        self.customViewAlert = LIHAlertManager.getCustomViewAlert(customView)
        self.customViewAlert?.initAlert(self.view)
    }
    func showBanner(sender: AnyObject) {
        self.customViewAlert?.show(nil, hidden: nil)
    }
```



####How to embed a view controller

![custom_list](https://cloud.githubusercontent.com/assets/12048316/23353854/88432f26-fcf4-11e6-9b95-d898f46775f5.gif)

```Swift
var customViewAlert: LIHAlert?
override func viewDidLoad() {
    super.viewDidLoad()
    let vc = (self.storyboard?.instantiateViewController(withIdentifier: "TableVc"))!
    self.customViewAlert = LIHAlertManager.getCustomViewAlert(customView: vc.view)
    self.customViewAlert?.initAlert(self.view)
    self.addChildViewController(vc)
    vc.didMove(toParentViewController: self)
}
func showBanner(sender: AnyObject) {
    self.customViewAlert?.show(nil, hidden: nil)
}
```
See 'CustomAlertsViewController' for more embed view controller examples

####How to create your own banner

```Swift
    let alertTextAlert: LIHAlert = LIHAlert()
    alertTextAlert.alertType = LIHAlertType.Text
    alertTextAlert.contentText = message
    alertTextAlert.alertColor = UIColor(red: 102.0/255.0, green: 197.0/255.0, blue: 241.0/255.0, alpha: 1.0)
    alertTextAlert.alertHeight = 50.0
    alertTextAlert.alertAlpha = 1.0
    alertTextAlert.autoCloseEnabled=true
    alertTextAlert.contentTextColor = UIColor.whiteColor()
    alertTextAlert.hasNavigationBar = true
    alertTextAlert.paddingTop = 0.0
    alertTextAlert.animationDuration = 0.35
    alertTextAlert.autoCloseTimeInterval = 1.5
```

#####ALert Types
```Swift
    enum LIHAlertType {
            case Custom, Text, TextWithLoading, TextWithIcon, TextWithButton, TextWithTwoButtons, TextWithTitle
    }
```

####List of all properties
```Swift
    //delegates
    public var delegate: LIHAlertDelegate?
    
    //Title
    public var titleLabel: UILabel?
    public var titleText: String //Default is "Sample Title"
    public var titleTextColor: UIColor //Default is UIColor.blackColor()
    public var titleTextFont: UIFont?
    public var titleTextFontSize: CGFloat?
    public var titleTextNumberOfLines: Int //Default is 1 
    
    
    //Content Text
    public var contentLabel: UILabel?
    public var contentText: String //Default is "Sample Content"
    public var contentTextColor: UIColor //Default is UIColor.blackColor()
    public var contentTextFont: UIFont?
    public var contentTextNumberOfLines: Int //Default is 2
    
    //TextWithLoading
    public var activityIndicatorStyle: UIActivityIndicatorViewStyle //Default is UIActivityIndicatorViewStyle.White
    
    //Icon
    public var  iconImageView: UIImageView?
    public var  icon: UIImage?
    
    //OneButton
    public var  button_textWithButton: UIButton?
    public var  buttonText: String //Default is "Dismiss"
    public var  buttonColor: UIColor //Default is UIColor.blueColor()
    public var  buttonTextColor: UIColor //Default is UIColor.whiteColor()
    public var  buttonFont: UIFont?
    public var  buttonBordercolor: UIColor //Default is UIColor.whiteColor()
    public var  buttonBorderWidth: CGFloat //Default is 1.0 
    public var  buttonCornerRadius: CGFloat //Default is 3.0
    public var  buttonWidth: CGFloat?
    
    //TWO BUTTONS
        //ButtonOne
    public var  buttonOne_textWithButton: UIButton?
    public var  buttonOneText: String //Default is "Dismiss"
    public var  buttonOneColor: UIColor //Default is UIColor.blueColor()
    public var  buttonOneTextColor: UIColor //Default is UIColor.whiteColor() 
    public var  buttonOneFont: UIFont?
    public var  buttonOneBordercolor: UIColor //Default is UIColor.whiteColor()
    public var  buttonOneBorderWidth: CGFloat //Default is 1.0
    public var  buttonOneCornerRadius: CGFloat //Default is 3.0
    
        //ButtonTwo
    public var  buttonTwo_textWithButton: UIButton?
    public var  buttonTwoText: String //Default is "Dismiss"
    public var  buttonTwoColor: UIColor //Default is UIColor.blueColor()
    public var  buttonTwoTextColor: UIColor //Default is UIColor.whiteColor()
    public var  buttonTwoFont: UIFont?
    public var  buttonTwoBordercolor: UIColor //Default is UIColor.whiteColor()
    public var  buttonTwoBorderWidth: CGFloat //Default is 1.0
    public var  buttonTwoCornerRadius: CGFloat //Default is 3.0
    
    //AlertView
    public var  alertView: UIView?
    public var  alertColor: UIColor //Default is UIColor.grayColor()
    public var  alertAlpha: CGFloat //Default is 1.0
    public var  alertHeight:CGFloat //Default is 75.0
    public var  paddingLeft: CGFloat //Default is 0.0
    public var  paddingTop: CGFloat //Default is 0.0
    public var  animationDuration: NSTimeInterval //Default is 0.5
    public var  alertType: LIHAlertType //Default is LIHAlertType.Text
    public var  autoCloseEnabled: Bool //Default is true
    public var  autoCloseTimeInterval: Double //Default is 3.0
    public var  hasNavigationBar: Bool //Default is false

```

### Use the completion callbacks
```Swift
    //when showing an auto hiding banner
    lihAlert?.show({ () -> () in
                //alert showed
            }, hidden: { () -> () in
                //alert hidden
        })
        
        //when hiding a banner
        lihAlert?.hideAlert({ () -> () in
            //Banner hidden
        })
```

### Known Issues
##### 1. Top margin
In some projects the alert may appear with a margin on top. Hopefully this will be fixed in the next release. Until then use the following solution.
###### Solution
Even the navigation bar is there, set it to false.
```Swift
alert.hasNavigationBar = false
```

### ChangeLog

v2.0.2
######Embed view controller support

v2.0.0
######Updated to Swift 3

v1.1.0
######Fixed an issue - Alerts comes to the top when it appears

v1.0.0
######Banner templates
* Text only
* Text with a title 
* Text with an ActivityIndicator
* Text with an icon
* Text with a button
* Text with two buttons
* Custom view banner


### Author

Lasith Hettiarachchi, lasithih@yahoo.com

### License

LIHAlert is available under the MIT license. See the LICENSE file for more info.
