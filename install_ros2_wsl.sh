#!/usr/bin/env bash
set -e

echo "Updating system..."
sudo apt update
sudo apt upgrade -y

echo "Installing prerequisites..."
sudo apt install -y locales software-properties-common curl gnupg2 lsb-release

echo "Setting locale..."
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

echo "Enabling universe repository..."
sudo add-apt-repository universe -y

echo "Cleaning old ROS sources..."
sudo rm -f /etc/apt/sources.list.d/ros2.list
sudo rm -f /etc/apt/sources.list.d/ros2.sources
sudo rm -f /etc/apt/sources.list.d/ros-latest.list
sudo rm -f /etc/apt/sources.list.d/ros2-apt-source.list
sudo rm -f /usr/share/keyrings/ros-archive-keyring.gpg

echo "Adding ROS 2 key..."
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key \
  -o /usr/share/keyrings/ros-archive-keyring.gpg

UBUNTU_CODENAME=$(lsb_release -cs)

if [ "$UBUNTU_CODENAME" = "noble" ]; then
  ROS_DISTRO="jazzy"
elif [ "$UBUNTU_CODENAME" = "jammy" ]; then
  ROS_DISTRO="humble"
else
  echo "Unsupported Ubuntu version: $UBUNTU_CODENAME"
  echo "Use Ubuntu 24.04 for ROS 2 Jazzy or Ubuntu 22.04 for ROS 2 Humble."
  exit 1
fi

echo "Using ROS 2 distro: $ROS_DISTRO"

echo "Adding ROS 2 repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $UBUNTU_CODENAME main" | \
  sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

echo "Installing ROS 2 desktop..."
sudo apt update
sudo apt install -y ros-$ROS_DISTRO-desktop

echo "Installing turtlesim and dev tools..."
sudo apt install -y \
  ros-$ROS_DISTRO-turtlesim \
  python3-colcon-common-extensions \
  python3-rosdep

echo "Initializing rosdep..."
if [ ! -f /etc/ros/rosdep/sources.list.d/20-default.list ]; then
  sudo rosdep init
fi
rosdep update

echo "Setting up bashrc..."
if ! grep -q "source /opt/ros/$ROS_DISTRO/setup.bash" ~/.bashrc; then
  echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc
fi

echo "Creating ROS 2 workspace..."
mkdir -p ~/ros2_ws/src
cd ~/ros2_ws
source /opt/ros/$ROS_DISTRO/setup.bash
colcon build

if ! grep -q "source ~/ros2_ws/install/setup.bash" ~/.bashrc; then
  echo "source ~/ros2_ws/install/setup.bash" >> ~/.bashrc
fi

echo ""
echo "Done!"
echo "Restart your terminal or run:"
echo "source ~/.bashrc"
echo ""
echo "Test with:"
echo "ros2 run turtlesim turtlesim_node"
