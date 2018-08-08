sudo apt-get update

sudo apt-get install -y can-utils git ruby 2> /dev/null

# Setup the vcan0 interface
sudo modprobe can
sudo modprobe vcan
sudo ip link add dev vcan0 type vcan
sudo ip link set up vcan0
