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

### Usage
**Text banner**


'''
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    }
'''
