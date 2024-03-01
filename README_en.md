## Turtlebot3 Demo Docker Environment

This repository provides a Docker environment for the official Turtlebot3 tutorials. It allows you to easily try out ROS 2 and Turtlebot3.

## Features

* ROS 2 development environment
* Turtlebot3 simulation environment

## Setup

```bash
git clone https://github.com/qoopen0815/turtlebot3_demo.git
cd turtlebot3_demo
docker compose up -d --build
```

## Running the Demo

1. Access the container (e.g., develop container)

```bash
docker exec -it develop /bin/bash
```

2. Start Gazebo

The Gazebo simulation in the turtlebot3_gazebo package fails to start, so we use the launch file in the nav2_bringup package instead.

```bash
ros2 launch nav2_bringup tb3_simulation_launch.py headless:=False
```

## Troubleshooting

If you encounter any problems, please refer to the following resources:

* Turtlebot3 official documentation: [https://www.turtlebot.com/turtlebot3/](https://www.turtlebot.com/turtlebot3/)
* Docker official documentation: [https://docs.docker.com/](https://docs.docker.com/)

## Acknowledgements

Many people have contributed to the creation of this repository. Thank you all.

## Feedback

* If you have any questions or suggestions, please feel free to open an issue on GitHub.
* I would appreciate any feedback you have on how to improve this repository.
