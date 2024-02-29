FROM qoopen/ros:humble-desktop
LABEL maintainer="KuwanoTomohiro<ku_fairlady_wa@outlook.com>"

# Update and upgrade apt packages
RUN apt update && apt upgrade -y
RUN apt clean && rm -rf /var/lib/apt/lists/*

# Install ROS packages
RUN apt update && \
    apt install -y \
    ros-humble-gazebo-* \
    ros-humble-cartographer \
    ros-humble-cartographer-ros \
    ros-humble-navigation2 \
    ros-humble-nav2-bringup \
    ros-humble-xacro
RUN apt remove -y \
    ros-humble-dynamixel-sdk \
    ros-humble-turtlebot3-msgs \
    ros-humble-turtlebot3
RUN apt clean && rm -rf /var/lib/apt/lists/*

# Install turtlebot packages
COPY ./src/DynamixelSDK /root/ros2_ws/src/DynamixelSDK
COPY ./src/turtlebot3_msgs /root/ros2_ws/src/turtlebot3_msgs
COPY ./src/turtlebot3_jp_custom /root/ros2_ws/src/turtlebot3_jp_custom
RUN cd /root/ros2_ws && \
    /bin/bash -c "source /opt/ros/humble/setup.bash; colcon build --symlink-install" && \
    /bin/bash -c "source ~/.bashrc"

# Install realsense packages
RUN apt update && \
    apt install -y ros-humble-realsense2-camera
COPY ./src/realsense-ros_jp_custom /root/ros2_ws/src/realsense-ros_jp_custom
COPY ./src/realsense_gazebo_plugin /root/ros2_ws/src/realsense_gazebo_plugin
RUN cd /root/ros2_ws && \
    /bin/bash -c "source /opt/ros/humble/setup.bash; colcon build --symlink-install" && \
    /bin/bash -c "source ~/.bashrc"

# Install tb3 simulation packages
COPY ./src/turtlebot3_simulations_jp_custom /root/ros2_ws/src/turtlebot3_simulations_jp_custom
COPY ./src/lightsfm /root/ros2_ws/src/lightsfm
RUN cd /root/ros2_ws/src/lightsfm && \
    make && make install
RUN /bin/bash -c "source /opt/ros/humble/setup.bash" && \
    rosdep install -y --from-paths /root/ros2_ws/src --ignore-src --rosdistro humble
RUN cd /root/ros2_ws && \
    /bin/bash -c "source /opt/ros/humble/setup.bash; colcon build --symlink-install" && \
    /bin/bash -c "source ~/.bashrc"
