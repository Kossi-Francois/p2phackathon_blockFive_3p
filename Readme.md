## Problem

*How to make NFT assets persistent*


## Solution

*Always in the spirit of using decentralized solutions, this problem can be solved using IPFS (InterPlanetary File System)*


3P NFT (Persitent Peer to Peer NFT)
is an application for creating and sending NFTs (persistent in IPFS through Pinata)

The backend is a FastApi python app [FastApi python app](https://github.com/Kossi-Francois/alpheenProject) to deploy on Aleph VM and
the frontend is a Flutter mobile app


## Installation

*Explain, step by step how someone can install your project and play with it. The jury will mostly use MacOS, Ubuntu, Android and iOS. Setting up a docker / docker-compose is a good idea to allow someone to test the project easily.*

The backend part is deployed on Aleph VM (as explained [here](https://github.com/aleph-im/aleph-vm))

To use the mobile application, simply retrieve the backend url and put it in the file lib/help.dart (to ALEPH_URL_BACKEND var) ; then just run the app
