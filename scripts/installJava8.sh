#!/bin/bash
# Installation script for Java 8
# Warning: oracle-java8-installer is interactive and asks for license agreement

sudo apt-get install software-properties-common
add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install oracle-java8-installer
