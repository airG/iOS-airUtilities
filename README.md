# airUtilities

[![Documentation](https://raw.githubusercontent.com/airG/iOS-airUtilities/master/docs/badge.svg?sanitize=true)](https://airg.github.io/iOS-airUtilities/)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Build Status](https://travis-ci.org/airG/iOS-airUtilities.svg?branch=master)](https://travis-ci.org/airG/iOS-airUtilities)

A framework of common iOS functions and extensions written in Swift.


## Installation

Installation is best managed using Carthage. Add `github "airg/iOS-airUtilities"` to your cartfile and run `carthage install`, see [Carthage Installation Guide](https://github.com/Carthage/Carthage#if-youre-building-for-ios-tvos-or-watchos).

You can also use Cocoapods to install. Add `pod 'airUtilities'` to your podfile.


## How to use airUtilities

`airLogging` is a convenient interface onto the system `os_log` if supported, or simple `NSLog` if debug. Example:  `Log("Check this out", as: .debug)`

airUtilities also contains some nice generics around working with TableViews and CollectionViews. You can register a class or nib using `tableView.registerNib(of: CustomTableViewCell.self)` and then dequeue it with `let cell: CustomTableViewCell = tableView.dequeueCell(for: indexPath)`.

`PropertyInitializing` allows you to initialize and set preperties on an object in a trailing closure, for example:

```
let label = UILabel {
    $0.textColor = .red
}
```

The handler extension on `UIButton` supports actions via closure, example: `button.handle(.touchUpInside, with: { print("Tapped!") })` or even:
```
button.handle(.touchUpInside) {
    print("Tapped!")
}
```

Adds class vars for `Identifier` and `Nib` for views and ViewControllers, based on `String(describing: self)`.

And many more, poke around the docs to find them.

## Documentation

Check out the [documentation](https://airg.github.io/iOS-airUtilities/). All calls should also be documented in the generated Swift interface.


## How it's made

airUtilities is currently written in Swift 4 with Xcode 9.2.

Documentation is generated using [Jazzy](https://github.com/realm/jazzy), a very useful tool for generating pretty docs.


## Contributing

Before opening a pull request, be sure to run `jazzy` to regenerate the docs.

### To Do

These are tasks that would be nice to implement soon, feel free to contribute!

- Add a nicer interface onto the `%{public}s` keywords for logging
- Consider an alternative to NSLog() when os_log is missing?
- Add log to file support
- Finish the test suite
