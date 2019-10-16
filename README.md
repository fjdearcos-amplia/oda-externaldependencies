# ODA External Dependencies

This repository contains wrapper projects to ease the cross-compilation of ODA external dependencies requiring with native code.

There are different profiles provided to make tests in a x86-84 computer, a raspberry pi and a Sierra Wireless FX30 device. Other devices should be easily included.

## Getting started

### Prerequisites

This software must be installed to build and run the application:
- [Java 8](https://www.java.com/en/download/faq/java8.xml)
- [Maven](https://maven.apache.org/)
- [Git](https://git-scm.com/)
- [Mercurial](https://www.mercurial-scm.org/)
- [CMake](https://cmake.org/)

### Building

To build the project you should use Maven. Before compiling the software you should install in your Maven local repository some ODA external dependencies not available in the Maven Central Repository

```shell
git clone --recursive git@github.com:amplia-iiot/oda.git
cd oda-externaldependencies
mvn clean install
```

## Contributing

ODA is develop by Amplía Soluciones company as open-source. We will be pleased to have feedback and suggestions of features you may find interesting

Feel free to contact us writing to [oda@amplia.es](mailto:oda@amplia.es?subject=[GitHub]) or opening your pull request.

## License

The code in this project is licensed under Apache License 2.0 [LICENSE](LICENSE)



