### Guide for running OpenRSC on MacOS

## Step 1

First, you will need to install Homebrew for Mac in Terminal via <a href="https://brew.sh">https://brew.sh </a>

To do so, open Terminal, copy and paste the following, and then press enter:
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

You need install Java, to do it, copy and paste the following in Terminal and press enter:
```
brew tap AdoptOpenJDK/openjdk && brew install adoptopenjdk8
```

You need istall Apache Ant too, copy and paste the following in Terminal and press enter:
```
brew install ant
```

## Step 2

You are now ready to use "Start-Linux.sh" (Skip the option for Install). Open Terminal, navigate to this folder, and execute:
```
./Start-Linux.sh
```
