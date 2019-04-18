

import Needle
import UIKit

// MARK: - Registration

public func registerProviderFactories() {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->ViewControllerComponent") { component in
        return ViewControllerDependencyf94e694d51fc38ba1ea6Provider(component: component)
    }
    
}

// MARK: - Providers

/// ^->RootComponent->ViewControllerComponent
private class ViewControllerDependencyf94e694d51fc38ba1ea6Provider: ViewControllerDependency {
    var logger: Logger {
        return rootComponent.logger
    }
    private let rootComponent: RootComponent
    init(component: NeedleFoundation.Scope) {
        rootComponent = component.parent as! RootComponent
    }
}
