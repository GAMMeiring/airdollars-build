# airdollars-build

Airdollars is a fork of Bitcoin to experiment with blockchain fundamentals and development of chain-analysis with a small network with altered configurations. 

## MAC Dependencies

- [Docker](https://www.docker.com/products/docker-desktop/)
- [XQuartz](https://www.xquartz.org/)

## Setup GUI using docker

1. Install Docker, Start Docker and Set Docker Preferences as needed
2. Install XQuartz and restart Mac
3. Get current IP address from Terminal using: `ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}'` ex. 192.168.3.77
4. Run XQuartz and set the correct Preferences to allow for GUI to run through Docker container. Preferences -> Security -> Check Allow connections from network clients
5. From xterm in XQuartz register your IP address from 3. as host `xhost 192.168.3.77`
6. ```docker build -t airdollars-gui .```
7. Run the GUI by specifying the IP address from 3. ```docker run -it -e DISPLAY=192.168.3.77:0 airdollars-gui```
8. You should now see your Airdollars GUI. 

<img width="856" alt="Screenshot 2022-10-24 at 08 49 39" src="https://user-images.githubusercontent.com/107536903/197475489-cdd5b942-8b86-47f8-94bf-efbacb42fe7b.png">

## [Reference Youtube walkthrough for XQuartz](https://youtu.be/cNDR6Z24KLM)
