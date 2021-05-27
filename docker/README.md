# my example website

Since the container should not be executed with root user so few modifications are required in the Dockerfile to change the default nginx image congiguration.
1) Nginx image comes with nginx (not-root) user by default.
2) Now chnage the ownership to nginx  of certain default folders like logs, cache and conf.d. 
3) Now create a pid file whose ownership should be nginx as the conatiner should run with nginx.
4) Change the user to nginx in Dokcerfile otherwise by default it considers root user.
5) No changes are required in docker-compose file just need to take care that the port used is beyond 1024 as all the ports below  1024 are reservers for root processes.
6) Will have to run this command to take local changes into effect:
   docker-compose up -d --no-deps --build web
7) 
