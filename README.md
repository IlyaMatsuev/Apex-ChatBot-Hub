# Apex Bot Lib

Badges.

Salesforce Apex package for quick configuration and managing of the chat bots (Telegram, Viber, WhatsApp, etc.).

## Overview

Some basic usage example:

```java
System.debug('Hello World!');
```

For more examples, please refer to the [examples page](docs/examples).

Project notes.

## Installation

### Dependencies

This project uses a few other libraries as dependencies:

1. Apex Trigger Framework, [github.com/IlyaMatsuev/Apex-Trigger-Framework](https://github.com/IlyaMatsuev/Apex-Trigger-Framework)
2. Metadata Service

So, they have to be installed first.

### From Unmanaged Package

You can just install the package by the link on a [sandbox](https://test.salesforce.com/packaging/installPackage.apexp?p0=<package-id>) or [dev org](https://login.salesforce.com/packaging/installPackage.apexp?p0=<package-id>).

If you prefer using salesforce CLI you can run:

```
sfdx force:package:install -p <package-id> -w 10 -b 10 -u <username>
```

### From Source

You can also install the package with the automated scripts: [`pkg-deploy.sh`](scripts/pkg-deploy.sh) and [`pkg-from-scratch.sh`](scripts/pkg-from-scratch.sh).  
First is for deploying changes to the existing org.

```
./scripts/pkg-deploy.sh <username-or-alias>
```

Second is for creating a new configured scratch org.

```
./scripts/pkg-from-scratch.sh <devhub-username-or-alias> <new-scratch-org-alias>
```

## Configuration

Custom settings, custom metadata or any other configuration example.

## Documentation

For more detailed information about the content of the repository and the sfdx package, please visit the [docs folder](docs).

## Questions

If you have any questions you can start a discussion.  
If you think something works not as expected or you want to request a new feature, you can create an issue with the appropriate template selected.

## Contributing

Pull requests are welcome.  
For major changes, please open an issue first to discuss what you would like to change.  
Please make sure to update tests as appropriate.

## License

[MIT](LICENSE)
