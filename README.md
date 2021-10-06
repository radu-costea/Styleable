# Styleable

A declarative alternative to SwiftUI which uses UIKit

## Installation 

**Swift Package Manager (SPM)**

To install Styleable using Swift Package Manager you can follow the tutorial published by Apple using the URL for the Styleable repo with the current version:

1. In Xcode, select “File” → “Swift Packages” → “Add Package Dependency”

2. Enter https://github.com/radu-costea/Styleable.git

## Introduction

Styleable adds some sugar to the good old UIKit that makes it look and feel almost as SwiftUI. This does not intend to be a replacement for SwiftUI, instead it inteds to help making the transition smoother and with less risks along the way.

## Getting started

Styleable uses the power of UIStackViews and the convenience of `@resultBuilders` to allow building the UI structure in a human readable fashion. 

## Core components of Styleable

### VStackView

A subclass of UIStackView that has the axis locked to `.vertical` and allows the use of result builders for `arrangedSubviews`

### HStackView

A subclass of UIStackView that has the axis locked to `.horizontall` and allows the use of result builders for `arrangedSubviews` 
  
### ZStackView

A subclass of UIView that lays out views one on top of the other. Useful when a container view is needed or when we need to pin subviews with some padding.

## Styles

A Style encapsulates some customization that can be reused / applied to any object of the target type. This way you can define some styles and apply them whenever needed. 
**Observation**: You can apply as many styles as you want to a view. The styles are applied in the same order they are passed. So if you want to make sure the customization of a style are visible, move it to the end of the list.

**Observation**: You can also apply styles of an ancestor class to any custom view.
 

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
