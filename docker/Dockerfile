ARG ROS_DISTRO=humble

FROM osrf/ros:${ROS_DISTRO}-desktop
LABEL maintainer="KuwanoTomohiro<ku_fairlady_wa@outlook.com>"

# Set to not be asked to select keyboard settings
ARG DEBIAN_FRONTEND=noninteractive

# Install apt packages
RUN apt update && apt upgrade -y
RUN apt install -y \
    tzdata \
    x11-apps \
    build-essential \
    python3 python3-pip \
    python3-colcon-common-extensions && \
    apt clean && rm -rf /var/lib/apt/lists/*
ENV TZ=Asia/Tokyo

# Install dependent ROS2 packages
RUN apt update && \
    apt install -y \
    ros-${ROS_DISTRO}-gazebo-* \
    ros-${ROS_DISTRO}-cartographer \
    ros-${ROS_DISTRO}-cartographer-ros \
    ros-${ROS_DISTRO}-navigation2 \
    ros-${ROS_DISTRO}-nav2-bringup \
    ros-${ROS_DISTRO}-xacro
RUN apt clean && rm -rf /var/lib/apt/lists/*

# Install Turtlebot3 Packages
RUN apt update && \
    apt install -y \
    ros-${ROS_DISTRO}-dynamixel-sdk \
    ros-${ROS_DISTRO}-turtlebot3-gazebo \
    ros-${ROS_DISTRO}-turtlebot3-msgs \
    ros-${ROS_DISTRO}-turtlebot3
RUN apt clean && rm -rf /var/lib/apt/lists/*

# Create workspace & Clone Turtlebot3 simulation package
RUN mkdir -p /root/ros2_ws/src
RUN git clone -b ${ROS_DISTRO}-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git /root/ros2_ws/src

# Environment Configuration
RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> /root/.bashrc
RUN echo 'export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/opt/ros/$ROS_DISTRO/share/turtlebot3_gazebo/models' >> /root/.bashrc
RUN /bin/bash -c "source /root/.bashrc"

# Build packages
RUN cd /root/ros2_ws && \
    /bin/bash -c "source /opt/ros/$ROS_DISTRO/setup.bash; colcon build --symlink-install" && \
    /bin/bash -c "source install/setup.bash"
RUN echo "source /root/ros2_ws/install/setup.bash" >> /root/.bashrc
