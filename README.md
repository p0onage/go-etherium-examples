# go-etherium-examples
This repository is build to demonstrate Etherium smart contracts. 

# Introduction 
I am currently developing this repository so you can quickly get involved with etherium smart contract development. This repository will be based on the offical go-etherium repository located here - https://github.com/ethereum/go-ethereum/wiki/Contract-Tutorial this repository go's into depth on commands for our blockchain CLI Geth so I won't do that here. 

Throughout these examples you will hopfully obtain usefull information and insight into the technology and be able to grasp etheriums coding languade Solidity.

# Guide

1. HelloWorld App - Why not start basic!
2. "A Piece Of The Cake!" - This app will demonstrate transactions, basically how to make a purchase and buy a piece of cake!
3. "Stop people getting pieces of cake!" - This smart contract will demonstrate permissions and limitting people purchasing your cake. They can however ask your permission. 


# Setup 

1. Download and install Geth, we use this tool to create the blockchain and run minners to do the work. You can download this executable from https://geth.ethereum.org/downloads/ afterwards add the geth executeable to your environment variables so you can easily run commands later on. Once done you can test in command prompt (CMD) with "geth help" command. 

2. Once you have geth setup, we need to intialise a blockchain ledger, this is essentially your blockchain solution. Clone this repository and go into the `initialise` folder and open command prompt in this directory. Once there you can use geth commands to initialise the blockchain. 

`mkdir .\eth\data` 
`geth --datadir=./eth/data init genesis.json`


# Starting And Interacting

1.  To start the blockchain, we can run a geth with parameters  like below 

 `geth --rpc --datadir ./eth/data --networkid 8338 --rpcport 8008 --rpccorsdomain "*" --rpcapi "db, eth,net,web3,miner,admin" --port 8765 --nodiscover --rpcaddr "0.0.0.0"  console`
 
2. From here we can perform commands directly in the command prompt window or visit http://remix.ethereum.org/ to connect to the blockchain and run commands via an interface. Remix will act as your IDE for deploying and testing smart contracts throughout these examples. 


 
