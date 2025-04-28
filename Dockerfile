# For x86
# FROM ros:jazzy-perception-noble 

# For arm64
FROM arm64v8/ros:jazzy-perception-noble 

# Install ROS2 packages
RUN apt-get -y update && apt-get install -y \
  ros-jazzy-desktop

# Install gz-harmonic
RUN curl https://packages.osrfoundation.org/gazebo.gpg --output /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
RUN apt-get -y update
RUN apt-get -y install gz-harmonic

RUN mkdir -p /root/ros2_ws/src
WORKDIR /root/ros2_ws
RUN /bin/bash -c "source /opt/ros/jazzy/setup.bash"
RUN echo "source /opt/ros/jazzy/setup.sh" >> /root/.bashrc
WORKDIR /root/ros2_ws/src
