# ROS2 using NoVNC

The Dockerfile provides:

- Ros2 Jazzy Desktop
- Gazebo Harmonic
- Rviz2
- Rust toolchain
- OpenCV

## Usage

> [!NOTE]
> Update `platform` in `docker-compose.yml` depending on architecture.

1. Run `docker-compose up --build`
2. Run `docker-compose exec ros bash` (`docker-compose up` has to be running)
3. Run `rviz2` or `gz sim` or `ros2 ...`
4. Open browser at `localhost:8080/vnc.html` and click connect.
