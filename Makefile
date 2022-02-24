NAME = inception

all: 
	@ mkdir -p /home/elaachac/data/wp_files/
	@ mkdir -p /home/elaachac/data/db_files/
	@ docker-compose -f ./srcs/docker-compose.yml up -d --build

up:
	@ docker-compose -f ./srcs/docker-compose.yml up -d
	
down:
	@ docker-compose -f ./srcs/docker-compose.yml down

clean: down
	@ cd $(SRCS) && docker container prune; 

fclean: clean
	@ sudo rm -rf /home/elaachac/data/wp_files
	@ sudo rm -rf /home/elaachac/data/db_files
	@ docker system prune -a



re: fclean all

 
.PHONY: up down clean fclean re all
