# MPSec

[![Language](https://img.shields.io/badge/NaverFest-Finalist-brightgreen.svg)](https://github.com/D2CampusFest/6th)
[![](https://img.shields.io/github/issues-pr/MPSec/Dashboard.svg?colorB=orange)](https://github.com/MPSec/Dashboard/pulls)
[![PR's Welcome](https://img.shields.io/badge/PRs%20-welcome-brightgreen.svg?colorB=yellow)](#contributing)


MPSec(Multipath Security) uses [mptcp protocol](https://github.com/multipath-tcp/mptcp), a multi-path transmission technology, to provide highly reliable networking that can effectively cope with network failure situations.

In addition, it has the following additional functions.
* **Environment configuration is simply available through [installer](https://github.com/MPSec/Dashboard/blob/master/readme/HowToBuild.md).**
* Real-time monitoring using `Dashboard` enables users to manage effectively.
* Packets are encrypted by using `IPSec`.
* Network speed is improved when communicating with similar bandwidth.
* Compatibility is good because it is possible to communicate with tcp protocol.

Please check Project details for more information.



## Project details

For details on project structure and technical design, please see the [Project Readme](/readme/Project_Readme.md).



## Contributing

This project welcomes contributions and suggestions. 

If you are interested in fixing issues and contributing directly to the code base, please see the document `How to Contribute`, which covers the following:

* [How to Contribute](/readme/HowToContribute.md)
* [How to build and run from source](/readme/HowToBuild.md)
* [Commit message rule](/readme/CommitMessageRule.md)
* [Development description for contribute](/readme/Dev.md)




## Feedback

* [Lables overview](https://github.com/MPSec/Dashboard/labels)
* [Convey a message or information in Github Issues.](https://github.com/MPSec/Dashboard/issues?utf8=%E2%9C%93&q=is%3Aopen+is%3Aissue+label%3Anotice)
* [Ask a question in Github Issues.](https://github.com/MPSec/Dashboard/issues?utf8=%E2%9C%93&q=is%3Aopen+is%3Aissue+label%3Aquestion)
* [Request a new feature in GitHub Issues.](https://github.com/MPSec/Dashboard/labels/new%20feature)
* [File a bug in GitHub Issues.](https://github.com/MPSec/Dashboard/issues?utf8=%E2%9C%93&q=is%3Aopen+is%3Aissue+label%3Abug)
* Any feedback is welcome! :)


## Demo

### Set Up MPSec

> Just Run

<p align="center">
   <img src="/md_images/set-up.gif" width="740px" height="383px"/>
</p>

### Start MPSec

> Just Run

<p align="center">
   <img src="/md_images/start_mpsec.gif" width="740px" height="383px"/>
</p>

### Multi Path

> Real-time measurement and display of four interface bandwidth

<p align="center">
   <img src="/md_images/demo_multipath.gif" width="740px" height="383px"/>
</p>

### IPSec

> Hide Packet

<p align="center">
   <img src="/md_images/demo_ipsec.gif" width="740px" height="383px"/>
</p>


## License

Licensed under the [GPL-3.0 License](/LICENSE).

