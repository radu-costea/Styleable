//
//  File.swift
//  
//
//  Created by Radu.Costea on 29.07.2021.
//

import Foundation

/// A standard implementation for a result builder which has the Component and array of ``T``
///
/// This implementation uses the array operations to build the resulting component:
///   - array join for build block / build array
///   - the non null component for ifs
///   - empty array for null
@resultBuilder public enum ArrayBuilder<T> {
    public typealias Component = [T]
    
    public static func buildExpression(_ expression: T) -> Component {
        [expression]
    }
    
    public static func buildExpression(_ expression: Component) -> Component {
        expression
    }
    
    public static func buildExpression(_ expression: Void) -> Component {
        []
    }
    
    public static func buildBlock(_ components: Component...) -> Component {
        buildArray(components)
    }
    
    public static func buildEither(first component: Component) -> Component {
        component
    }
    
    public static func buildEither(second component: Component) -> Component {
        component
    }
    
    public static func buildOptional(_ component: Component?) -> Component {
        component ?? []
    }
    
    public static func buildArray(_ components: [Self.Component]) -> Self.Component {
        components.flatMap{ $0 }
    }
}
