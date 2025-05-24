FROM ros:jazzy-perception-noble 

# Install essentials
RUN apt -y update && apt-get install -y \
  curl \
  wget \
  python3.12-venv \
  lsb-release \
  clang \
  libclang-dev \
  libopencv-dev \
  gnupg 

# Install Rviz2, rqt_graph etc.
RUN apt install -y ros-jazzy-desktop

# Install gz-harmonic
RUN curl https://packages.osrfoundation.org/gazebo.gpg --output /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
RUN apt -y update
RUN apt -y install gz-harmonic

# Install ROS2 packages
RUN apt install -y \
  ros-jazzy-nav2* \
  ros-jazzy-turtlesim 

# Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN rustc --version && cargo --version

# Nix
RUN curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install linux --no-confirm --init none
RUN . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
RUN /root/.nix-profile/bin/nix profile install \
  nixpkgs#neovim \
  nixpkgs#yazi \
  nixpkgs#tmux \
  nixpkgs#fzf \
  nixpkgs#ripgrep \
  nixpkgs#fd \
  nixpkgs#git \
  nixpkgs#btop \
  nixpkgs#nodejs \
  nixpkgs#pnpm

# Latex
RUN apt install -y texlive texlive-fonts-extra texlive-fonts-recommended texlive-latex-extra texlive-xetex dvipng

# General setup
RUN mkdir -p /root/ros2_ws/src
WORKDIR /root/ros2_ws
RUN echo "source /opt/ros/jazzy/setup.bash" >> /root/.bashrc
RUN echo "source /root/coordinated-robot-search/ros_ws/install/local_setup.bash" >> /root/.bashrc
WORKDIR /root/coordinated-robot-search/ros_ws
