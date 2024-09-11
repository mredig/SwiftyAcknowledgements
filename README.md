# SwiftyAcknowledgements
![Platform](https://img.shields.io/badge/platform-iOS%20%7C%20tvOS-lightgrey.svg)

SwiftyAcknowledgements makes it easy to integrate acknowledgements for third party libraries into your iOS Apps.

I should Swiftly Acknowledge that I am not the original author of this package. I've simply updated it with SPM and a couple other things. You can find the original [here](https://github.com/mathiasnagler/SwiftyAcknowledgements).

## Requirements (might be accurate)

- iOS 12.0 or higher
- tvOS 12.0 or higher
- Xcode 14 or higher

## Components

SwiftyAcknowledgements consists of two components.

### Script

`GenerateLicenseFileExe` is a Swift script that scans a directory for files containing the word `license` and generates a property list containing the content of every license along with a name. The name will be set to the name of the folder that the corresponding license file is contained in.

### Framework

~~**SwiftyAcknowledgements** comes with a framework `SwiftyAcknowledgements.framework` that can be used to visualize the generated license file within an iOS App. The framework contains a **TableViewController** and a **DetailViewController** and can be integrated programatically or using a **Storyboard**.~~
Using SPM the library is statically linked and magic.

## Installation

### Swift Package Manger
1. Add this url to your SPM packages:
	```
	https://github.com/mredig/SwiftyAcknowledgements.git
	```

1. Create a new run script in Xcode's build process and paste (with edits) this snippet. Update the `ACK_PLIST_PATH` and `ROOT_DEPENDENCIES_DIRECTORY` (if necessary) variables. You can add multiple paths with dependcy directories.
	```sh
	#!/usr/bin/env bash
	
	ACK_PLIST_PATH="[Your Project]/[Project Path]/Acknowledgements.plist"
	ROOT_DEPENDENCIES_DIRECTORY="../" # if you're exclusively using SPM, this should work. You may add other resources like so:
	# ROOT_SECONDARY_DEPENDENCIES_DIRECTORY="another/path"

	pushd "${BUILD_ROOT}/../../SourcePackages/checkouts/SwiftyAcknowledgements/"
	./GenerateLicenseFile "${ROOT_DEPENDENCIES_DIRECTORY}" -o "${PROJECT_DIR}/${ACK_PLIST_PATH}"
	# ./GenerateLicenseFile "${ROOT_DEPENDENCIES_DIRECTORY}" "${ROOT_SECONDARY_DEPENDENCIES_DIRECTORY}" -o "${PROJECT_DIR}/${ACK_PLIST_PATH}" # use this if you have multiple dependency directories
	popd
	```
1. Uncheck `Based on Dependency Analysis` on the run step.
1. After that, build your project. This will create the Acknowledgements.plist file that you can then add to your project.
1. Subsequent builds will automatically update the file with additional dependencies as you add and remove* them.
	* \* you might need to manually remove the source dependency folder, as Xcode doesn't appear to delete the checked out code when you remove an SPM dependency.

## Usage

The framework contains `AcknowledgementsTableViewController.swift` that can be pushed onto a `UINavigationController` or presented modally. The `AcknowledgementsTableViewController` will automatically look for a file `Acknowledgements.plist` and display its contents. If your license file is named differently, you can specify your custom name using the property `acknowledgementsPlistName: String`.

## Customization

There are several ways you can customize the appearance of SwiftyAcknowledgements ViewControllers. The easiest possibility is to integrate using a storyboard and setting the provided IBInspectables on AcknowledgementsTableViewController. Using this method you can customize *font sizes* and the text for the *table header* and *footer*.

If you need additional customization options, you can always build a custom subclasses for the provided ViewControllers and override the desired methods.

## Credits

**SwiftyAcknowledgements** was inspired by Vincent Tourraine's [VTAcknowledgementsViewController](https://github.com/vtourraine/VTAcknowledgementsViewController).

## License

**SwiftyAcknowledgements** is available under the MIT license. See the LICENSE file for more info.
