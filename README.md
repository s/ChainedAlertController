# ChainedAlertController
A mechanism for chaining UIAlertController's to each other

A small iOS code snippet to create dynamically chained UIAlerts. Example usage:

```swift
fileprivate lazy var firstAction: ChainedAlertTree = {
    let cancelAction = ChainedAlertAction(title: "Cancel", style: .cancel, shouldTriggerNextAlert: false, handler: nil)
    let triggerNextAction = ChainedAlertAction(title: "Trigger next", style: .default, shouldTriggerNextAlert: true, handler: nil)
    let alert = ChainedAlert(title: "First alert title", message: "First alert message", actions: [cancelAction, triggerNextAction])
    return ChainedAlertTree.alert(alert: alert, nextAlert: secondAction)
}()

fileprivate lazy var secondAction: ChainedAlertTree = {
    let cancelAction = ChainedAlertAction(title: "Cancel", style: .cancel, shouldTriggerNextAlert: false, handler: nil)
    let triggerNextAction = ChainedAlertAction(title: "Trigger next", style: .default, shouldTriggerNextAlert: true, handler: nil)
    let alert = ChainedAlert(title: "Second action title", message: "Second action message", actions: [cancelAction, triggerNextAction])
    return ChainedAlertTree.alert(alert: alert, nextAlert: thirdAction)
}()

fileprivate lazy var thirdAction: ChainedAlertTree = {
    let cancelAction = ChainedAlertAction(title: "It's enough.", style: .cancel, shouldTriggerNextAlert: false, handler: nil)
    let alert = ChainedAlert(title: "Third action title", message: "Third action message", actions: [cancelAction])
    return ChainedAlertTree.alert(alert: alert, nextAlert: nil)
}()
```

And then:
```swift
showChainedAlert(alert: firstAction)
```
