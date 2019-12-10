# MIPS PROCESSOR

This is a pipelined mips processor created in Verilog

## Getting Started

Run all the files in terminal as iverilog *.v and see the gtkwave for the results.
Here the output will be shown in terms of waves in gtkwave telling which signal is on and at what state.
In this README.md I have given the instructions for Linux and Windows will put in later.

### Prerequisites

The only prerequisite required is **iverilog** and **gtkwave**.

```
Give examples
```

### Installing

A step by step series of examples that tell you how to get a development env running

Say what the step will be

1. Download iverilog for the program to run on your computer via the following method. 

```
 sudo add-apt-repository ppa:team-electronics/ppa
 sudo apt-get update
 sudo apt-get install iverilog
```
2. Then See if you have gtkwave or not and to download it use the following Linux commands
```
 sudo apt-get install gtkwave
```

check out this page for more Help!
http://inf-server.inf.uth.gr/~konstadel/resources/Icarus_Verilog_GTKWave_guide.pdf.

## Running the tests

You can check if each module is running or not via the testbench in each module.
So running them individually will work.

### Break down into end to end tests

You nned to do this check before running so you know no module is becoming faulty for you.
You can create specific testcases and tell me if its failing for any of them as well.

```
iverilog ALU.v
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Iverilog](http://iverilog.icarus.com/) - The coding language used

## Contributing

1. [Saksham Agarwal](https://github.com/Dragonsa15)
2. [Utkarsh Agarwal](https://github.com/woolllff)
3. [Sowmith Nandan](https://github.com/sowmithnandan)

## Acknowledgments

* Nandita Rao Mam(as she was the one who gave this to us as a project)
