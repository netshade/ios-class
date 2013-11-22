Class Goals
* Familiar with C
 - data types
 - structs, lack of objects
 - arrays
 - bytes, bits, contiguous memory
 - pointers, malloc / free, pointer arithmetic
 - #define, preprocessor
* Familiar with Objective C
 - message dispatch
 - preprocessor commands
 - literals
 - NS* heritage
* Write a simple C application
* Use a compiler
* Debugger
* Overview of Unix / Posix fundamentals (??)
 - man page lookup
 - header files as api documentation
* Welcome to XCode
* Access Documentation
* Understand Basics of Cocoa Fundamentals
 - What is an NSObject
 - NSString, NSNumber
 - NSDictionary, NSArray, Mutable Derivations
 - Memory management ( and ARC )
 - Discussion of all the different frameworks that use Cocoa as a base (AVFoundation, SceneKit, everything...)
* What is an iOS App
 - UIApplication
 - UIViewController, UIView
 - Models ( Core Data, Business, Whatever )
* The Tools
 - Interface Builder
 - Storyboard
 - Model Designer
 - Instruments
* Create a basic iOS App
 - What it looks like
   + UINavigationController
   + UIViewController
   + UIButton
* Deploy to phone
 - Running on phone vs. running on simulator
* Use debugger
 - Set breakpoint
 - Inspect value
 - LLDB console
* Core Data
 - Describe a model
 - Initialize it
 - Model lifecycle
 - Asides on proper usage
* UITableView
 - As an example of data driven / delegate driven UI controls
 - The delegation pattern, its use throughout Apple frameworks
 - Handling events
* Ye Holy Main Threade
* Step Back And Review
* Networking
 - Usually means HTTP
 - NSURLConnection, NSURLSession
 - Libraries that "purport" to make networking easier
 - Asynchronous behavior
 - Decoupling IO from the main thread
* GCD
 - dispatch_async
 - Block syntax
 - Memory rules are "complicated"
 - Asynchronous != concurrent
 - The named queues
* Networking and GCD
* Let's Integrate with a web service (StackOverflow maybe?)
 - TODO: pick one
 - Showcase refreshing data
 - Store locally in Core Data
 - Discuss sync errors, remote race conditions, problems thereof
 - NSURLCache
 - Radio / Battery usage
* The UIApplication lifecycle
 - Foreground, background, inactive
 - Responding to changes
 - Responding to external (machine level) events
* Push Notifications
 - Integrate Urban Airship
 - External libraries in your iOS app
 - How to respond to these out-of-app notifications
 - The use of push notifications in the iOS 7 world
 - The value of services like Urban Airship vs. writing your own
 - Gems / libraries that allow you to write your own
* Errors
 - Handling exceptions
 - Debugging NSError
 - Using error collection services like Crashlytics
* Instruments
 - Profiling
 - Measuring
 - Device v. Simulator
 - The importance of multiple devices
 - Issues regarding testing old versions
 - Jailbroken users are jerks
* Analytics
 - Flurry, et al
* Going to the App Store
 - The Requirements ( Screenshots, description, categories )
 - Prerequisites for selling
 - The Review Process
 - You Have No Guarantees
* Class Review
 - What We've Learned
 - What We Haven't Learned
 - Where to go when we have problems
 - Local Resources
 - Don't fear the framework
