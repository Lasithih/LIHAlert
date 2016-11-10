# LIHAlert

#####LIHAlert provides animated banners for iOS which is written using the apple's newest programming language Swift 2.0.
#####Updated to Swift 3

[![CI Status](http://img.shields.io/travis/Lasith Hettiarachchi/LIHAlert.svg?style=flat)](https://travis-ci.org/Lasith Hettiarachchi/LIHAlert)
[![Version](https://img.shields.io/cocoapods/v/LIHAlert.svg?style=flat)](http://cocoapods.org/pods/LIHAlert)
[![License](https://img.shields.io/cocoapods/l/LIHAlert.svg?style=flat)](http://cocoapods.org/pods/LIHAlert)
[![Platform](https://img.shields.io/cocoapods/p/LIHAlert.svg?style=flat)](http://cocoapods.org/pods/LIHAlert)



###Demo Project
The LIHAlert workspace contains a demo project, also used for development.

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
* Text only
* Text with a title 
* Text with an ActivityIndicator
* Text with an icon
* Text with a button
* Text with two buttons
* Custom view banner

LIHAlert contains some predefined alert templates for each Alert type. You can use following code snippets to use them. 

##### How to use banner templates
#####1. Text Banner
<img src="http://3.bp.blogspot.com/-LLVpn6KrnNg/ViiaKmCHIqI/AAAAAAAACsw/13dVIUMG7E0/s300/TextBanner.gif" />

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


#####2. Banner with a text and an icon
<img src="http://2.bp.blogspot.com/-pMF5l-2VR0c/ViiaJ8bohOI/AAAAAAAACss/qFciyfThVUg/s300/Success.gif" />

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

#####3. Text with title

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


#####4. Loading Alert

This is a banner with a text and an activity indicator. This is not an auto close banner. You have to hide it when the process is finished.

<img src="http://3.bp.blogspot.com/-ASkTzpFIuSU/ViiaK2_mSYI/AAAAAAAACs8/6stjXecZWqI/s300/TextWithLoading.gif" />

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

#####5. Text with a button Alert
This alert contains a button along with a text. More suitable for notifying important messages to user.
<img src="http://2.bp.blogspot.com/-lrD_IGv93yE/ViiaKyqoRVI/AAAAAAAACs4/ggqDlP9E-YY/s300/TextWithButton.gif" />

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
Implement your view controller from LIHAlertDelegate.

```Swift
class ViewController: LIHAlertDelegate {
    func buttonPressed(button: UIButton) {
        print(“You have pressed the button”)
        self.textWithButtonAlert?.hideAlert(nil)
    }
}
```

#####6. Text with two buttons Alert
This alert contains two buttons along with a text.

<img src="http://3.bp.blogspot.com/-1pXYpVNoNz0/ViiaLcHSqnI/AAAAAAAACtI/NQjV1Pe9ACs/s300/TextWithTwoButtons.gif" />

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
Implement your view controller from LIHAlertDelegate.

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


#####7. Custom View Alert
You can specify any view to act as the banner.

<img src="http://4.bp.blogspot.com/-lHReuTyaJ8A/ViiaJyAiEfI/AAAAAAAACso/Q9A-X3MNcTo/s300/CustomView.gif" />

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

####How to Create a banner

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
