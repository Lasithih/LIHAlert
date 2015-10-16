# LIHAlert
LIHAlert privides animated banners for iOS which is written using the apple's newest programming language Swift 2.0. 

### Requiremints
Xcode 7+

### Alert Types
<UL>
<li>Text banner</li>
<li>Text with an ActivityIndicator</li>
<li>Text with an icon</li>
<li>Text with a button</li>
<li>Text with two buttons</li>
<li>Custom view banner</li>
</UL>

###Usage

####1. Predefined Banners

LIHAlert containes some predefined alerts for each Alert type. You can use following code snippets to use them. 

#####Text Banner

This is a banner with a text. This will close automatically in 1.5 seconds.

```Swift
    var textAlert: LIHAlert?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textAlert = LIHAlertManager.getTestAlert("Sample Message")
        self.textAlert?.initAlert(self.view)
    }

    func showBanner(sender: AnyObject) {
        
        self.textAlert?.show(nil, hidden: nil)
    }
```
Call showBanner() function to show the banner

#####Text with an ActivityIndicator

This is a banner with a text and an activity indicator. This is not an auto close banner. Tou have to hide it when the process is finished.

```Swift
    var processingAlert: LIHAlert?

var textAlert: LIHAlert?

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
You can change the activity indicator style by using,
```Swift
    processingAlert?.activityIndicatorStyle = UIActivityIndicatorViewStyle.WhiteLarge
```


####1. Create a banner
