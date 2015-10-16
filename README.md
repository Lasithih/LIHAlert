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

####Predefined Banners

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
