# ROS2 on Mac using NoVNC

> [!NOTE]
> Uncomment `FROM` statement in `Dockerfile` depending on architecture.

1. Run `docker-compose up --build`
2. Run `docker-compose exec ros bash` (`docker-compose up` has to be running)
3. Run `rviz2`
4. Open browser to `localhost:8080/vnc.html` and click connect.
