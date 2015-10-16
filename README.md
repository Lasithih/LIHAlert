# LIHAlert
LIHAlert provides animated banners for iOS which is written using the apple's newest programming language Swift 2.0. 

### Requirements
Xcode 7+

### Alert Types
* Text banner
* Text with an ActivityIndicator
* Text with an icon
* Text with a button
* Text with two buttons
* Custom view banner

###Usage

####1. Predefined Banners

LIHAlert contains some predefined alerts for each Alert type. You can use following code snippets to use them. 

#####Text Banner

This is a banner with a text. This will close automatically in 1.5 seconds.

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

#####Processing Alert

This is a banner with a text and an activity indicator. This is not an auto close banner. You have to hide it when the process is finished.

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

#####Success Alert
This is a banner with a text and an icon. This will close automatically in 1.5 seconds.

```Swift
    var successAlert: LIHAlert?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.successAlert = LIHAlertManager.getSuccessAlert("Successfully subscribed")
        self.successAlert?.initAlert(self.view)
    }
    func showBanner(sender: AnyObject) {
        self.successAlert?.show(nil, hidden: nil)
    }
```
Call showBanner() function to show the banner.

To change the icon,
```Swift
    successAlert?.icon = UIImage(named:"imageName")
```

#####Error Alert
Behavior of this alert is identical to Success Alert accept banner color, text and icon.

```Swift
    var errorAlert: LIHAlert?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.errorAlert = LIHAlertManager.getErrorAlert("Failed. Please try again")
        self.errorAlert?.initAlert(self.view)
    }
    func showBanner(sender: AnyObject) {
        self.errorAlert?.show(nil, hidden: nil)
    }
```
Call showBanner() function to show the banner

#####Text with a button Alert
This alert contains a button along with a text. More suitable to use to alert important messages to user.

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

#####Text with two buttons Alert
This alert contains two buttons along with a text.

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


#####Custom View Alert
You can specify any view to act as the banner.

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

####2. Create a banner
