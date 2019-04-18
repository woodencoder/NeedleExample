

import NeedleFoundation

// MARK: - Registration

public func registerProviderFactories() {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->NoteDetailsComponent") { component in
        return NoteDetailsDependency74b9e800b5be615aa574Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->NotesComponent") { component in
        return NotesDependencyfa72b752400e7eb987ecProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->EditNoteComponent") { component in
        return EditNoteDependency9539764615603c5ccc3eProvider(component: component)
    }
    
}

// MARK: - Providers

/// ^->RootComponent->NoteDetailsComponent
private class NoteDetailsDependency74b9e800b5be615aa574Provider: NoteDetailsDependency {
    var notesService: NotesService {
        return rootComponent.notesService
    }
    var logger: Logger {
        return rootComponent.logger
    }
    var editNoteBuilder: EditNoteBuilder {
        return rootComponent.editNoteBuilder
    }
    private let rootComponent: RootComponent
    init(component: NeedleFoundation.Scope) {
        rootComponent = component.parent as! RootComponent
    }
}
/// ^->RootComponent->NotesComponent
private class NotesDependencyfa72b752400e7eb987ecProvider: NotesDependency {
    var notesService: NotesService {
        return rootComponent.notesService
    }
    var logger: Logger {
        return rootComponent.logger
    }
    var noteDetailsBuilder: NotesDetailsBuilder {
        return rootComponent.noteDetailsBuilder
    }
    private let rootComponent: RootComponent
    init(component: NeedleFoundation.Scope) {
        rootComponent = component.parent as! RootComponent
    }
}
/// ^->RootComponent->EditNoteComponent
private class EditNoteDependency9539764615603c5ccc3eProvider: EditNoteDependency {
    var analyticsService: AnalyticsService {
        return rootComponent.analyticsService
    }
    var notesService: NotesService {
        return rootComponent.notesService
    }
    private let rootComponent: RootComponent
    init(component: NeedleFoundation.Scope) {
        rootComponent = component.parent as! RootComponent
    }
}
