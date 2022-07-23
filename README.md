## ZRP PROJECT

This project was developed as part of the challenge proposed by ZRP.

### Project specifications

- Ruby 3.1.1
- Rails 7
- Bundler 2.3.7
- Database PostgreSQL
 
### How to setup application

#### By using docker

1. After cloning this project, just type ```docker-compose up -d```;
2. If get no errors, you could be type ```docker container ls``` to confirm that services it's running;
3. Now, you can access app container to run project by typping ```docker-compose exec app bash```;
4. After it, run ```bundle install && rails db:create db:migrate```;
5. Then, run app by typping ```rails s -b 0.0.0.0```;

#### By run app locally

1. Install ruby 3.1.1, then install bundler and rails.
2. Run ```docker-compose up db```.
3. Adjust database.yml to access docker database.
5. Access the folder of project and run ```bundle install```.
5. Run ```rails db:create db:migrate```.
6. Finally, run ```rails s```.

### How to run specs

1. After cloning this project, run ```docker-compose up -d```.
2. Access the api container with command ```docker-compose exec app bash```.
3. Then run ```rails db:test:prepare```.
4. Finally, just run ```rspec spec/```.
