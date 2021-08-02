# Styleable

A declarative alternative to SwiftUI which uses UIKit

Examples:

**A login form**

```swift

let view = ZStackView {
    VStackView(spacing: 10) {
        UITextField()
            .with(\.placeholder, "Email")
            .with(\.keyboardType, .emailAddress)
            .with(\.borderStyle, .roundedRect)
        
        UITextField()
            .with(\.isSecureTextEntry, true)
            .with(\.borderStyle, .roundedRect)
            .with(\.placeholder, "Passsword")
    }
}

```

With styles:

```swift

extension Style where Target: UITextField {
    static var email: Self {
        Style {
            $0.keyboardType = .emailAddress
        }
    }
    
    static var rounded: Self {
        Style {
            $0.borderStyle = .roundedRect
        }
    }
    
    static var secure: Self {
        Style {
            $0.isSecureTextEntry = true
        }
    }
}

```

The new login form:

```swift
let view = ZStackView {
    VStackView(spacing: 10) {
        UITextField()
            .style(.rounded, .email)
            .with(\.placeholder, "Email")

        UITextField()
            .style(.rounded, .secure)
            .with(\.placeholder, "Password")
    }
}
```

More examples coming soon..
