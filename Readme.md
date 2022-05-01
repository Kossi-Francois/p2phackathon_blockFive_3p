## Problem

*How to make NFT assets persistent*
NFTs have already shown their usefulness in several fields (like art). But the link that exists between the NFT and the asset it represents is only maintained by the platform that issued it.
And so if we do for example from a platform (virtual world), we keep the NFT because it is on the blockchain, but we lose the asset, which in other words makes the value of the NFT zero


## Solution

*Always in the spirit of using decentralized solutions, this problem can be solved using IPFS (InterPlanetary File System)*


3P NFT (Persitent Peer to Peer NFT) is an application for creating and sending NFTs (persistent through IPFS)

The backend is a FastApi python app [FastApi python app](https://github.com/Kossi-Francois/alpheenProject) to deploy on Aleph VM and
the frontend is a Flutter mobile app


## Installation

*
Backend: The backend part is deployed on Aleph VM (as explained [here](https://github.com/aleph-im/aleph-vm))
  1- clone the repository
  2- add firebase credentials to store user data
  3- add [Pinata ](https://app.pinata.cloud/) credentials to get access to IPFS
  
  
Mobile Frontend: The mobile app is a flutter app that can easily be installed on IOS and Android
  1- clone the repository
  2- retrieve the backend url(after deploying the backend) and put it in the file lib/help.dart (to ALEPH_URL_BACKEND var) ; 
  3- then just run the app
*



![alt text](https://github.com/Kossi-Francois/p2phackathon_blockFive_3p/blob/main/screen.png?raw=true)


## How to Use

*The use is very simple*.
1. Connect to the application by creating an account
2: choose an image from the application, it is then added to IPFS
3. Choose or not to create my nft, if yes the NFT will contain the IPFS Hash of the file



## Side-Quests

- Side quest 1 - use of [IPFS](https://github.com/Kossi-Francois/alpheenProject/blob/main/ipfsmod/mainIPFS.py)  : Protocol Labs
- Side quest 2 - hosting:  Aleph-1

