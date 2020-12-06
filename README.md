# MPSec
![ci](https://github.com/MPSec/MPSec/workflows/ci/badge.svg)
[![Language](https://img.shields.io/badge/NaverFest-Finalist-brightgreen.svg)](https://github.com/D2CampusFest/6th)
[![Language](https://img.shields.io/badge/oss2020-prize-blue)](https://www.oss.kr/festival/award)
[![GitHub issues](https://img.shields.io/github/issues/MPSec/MPSec.svg)](https://github.com/MPSec/MPSec/issues)
[![PR's Welcome](https://img.shields.io/badge/PRs%20-welcome-brightgreen.svg?colorB=orange)](#contributing)


MPSec(Multipath Security) uses [mptcp protocol](https://github.com/multipath-tcp/mptcp), a multi-path transmission technology, to provide highly reliable networking that can effectively cope with network failure situations.

In addition, it has the following additional functions.

* **Environment configuration is very simple through Docker.**
* Real-time monitoring using `Backoffice` enables users to manage effectively.
* Packets are encrypted by `IPSec`.
* Network speed is improved when communicating with similar bandwidth.
* Compatibility is good because it is possible to communicate with tcp protocol.

Please check Project details for more information.



## Project Details

For details on project structure and technical design, please see the [Project Readme](/readme/Project_Readme.md).



## Contributing

This project welcomes contributions and suggestions.

If you are interested in fixing issues and contributing directly to the code base, please see the document below.

* [How to Contribute](/readme/HowToContribute.md)
* [How to build and run from source](/readme/HowToBuild.md)
* [Development description for contribute](/readme/Dev.md)




## Feedback

* [Lables overview](https://github.com/MPSec/Dashboard/labels)
* [Convey a message or information in Github Issues.](https://github.com/MPSec/Dashboard/issues?utf8=%E2%9C%93&q=is%3Aopen+is%3Aissue+label%3Anotice)
* [Ask a question in Github Issues.](https://github.com/MPSec/Dashboard/issues?utf8=%E2%9C%93&q=is%3Aopen+is%3Aissue+label%3Aquestion)
* [Request a new feature in GitHub Issues.](https://github.com/MPSec/Dashboard/labels/new%20feature)
* [File a bug in GitHub Issues.](https://github.com/MPSec/Dashboard/issues?utf8=%E2%9C%93&q=is%3Aopen+is%3Aissue+label%3Abug)
* Any feedback is welcome! :)




## Quick Start

### Auto Compile Advanced MPTCP Ubuntu Kernel

> Just Run, Please wait a little longer. :) <br/>
> The currently supported version is `ubuntu:16.04`

~~~shell
./set-up-ubuntu-16.04.sh   # The path is /MPSec/installer
~~~

### Start MPSec

> Pull the docker image and run it. <br/>
> If Docker is not installed, install Docker through the following command.

#### Install Docker

~~~shell
curl -fsSL https://get.docker.com/ | sudo sh   # Install
sudo usermod -aG docker $USER                  # Give authority to the user who is currently connected
docker version                                 # Check installed
~~~

#### Login, Run(Pull) MPSec Docker

- For details on project packages, please see the [GitHub MPSec Packages](https://github.com/MPSec/MPSec/packages).
- [Only Read Packages Token](/contents/read_packages_token.md)

~~~shell
# docker login with `read:packages token`
docker login docker.pkg.github.com/mpsec/mpsec/mpsec-app -u {user.name} -p {read:packages token number}
docker run -d -p 1234:8080 docker.pkg.github.com/mpsec/mpsec/mpsec-app
~~~


## Monitoring

### Welcome

![dashboard](/assets/welcome.gif)

### MultiPath

> Real-time measurement and display of four interface bandwidth

<p align="center">
   <img src="/assets/demo_multipath.gif" width="740px" height="383px"/>
</p>

### IPSec

> Hide Packet

<p align="center">
   <img src="/assets/demo_ipsec.gif" width="740px" height="383px"/>
</p>

### System Config

> Real-time system config monitoring

<p align="center">
   <img src="/assets/system.gif" width="740px" height="383px"/>
</p>
