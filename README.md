## ZRP PROJECT


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
4. After it, run ```bundle install && rails db:migrate```;
5. Then, run app by typping ```rails s -b 0.0.0.0```;

#### By run app locally

### How to run specs
