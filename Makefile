NAME = inception

all: 
	@ echo '127.0.0.1	elaachac.42.fr' | sudo tee -a /etc/hosts #tester avec seulement echo >>
	@ mkdir -p /home/kali/data/wp_files/
	@ mkdir -p /home/kali/data/db_files/
	@ docker-compose -f ./srcs/docker-compose.yml up -d --build

up:
	@ docker-compose -f ./srcs/docker-compose.yml up -d
	
down:
	@ docker-compose -f ./srcs/docker-compose.yml down

clean: down
	@ cd $(SRCS) && docker container prune; 

fclean: clean
	@ sudo rm -rf /home/kali/data/wp_files
	@ sudo rm -rf /home/kali/data/db_files
	@ docker system prune -a



re: fclean all

 
.PHONY: up down clean fclean re all
