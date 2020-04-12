<< -COMMENT-
Append aliases:
cat cli/.bashrc >> ~/.bashrc && source ~/.bashrc

! Overwrite aliases:
cat cli/.bashrc >| ~/.bashrc && source ~/.bashrc
-COMMENT-

#> Bash customization.
alias ll='ls -la --color=auto'
alias gitinit='git init && git add . && git commit -m "Init."'
#< Bash customization.

#> Docker.
alias dcu='docker-compose up -d'
alias dcub='docker-compose up --build -d'
alias dps='docker ps'
alias dcd='docker-compose down'
alias dstop='docker stop $(docker ps -a -q)'
alias drm='docker rm $(docker ps -a -q)'
alias dclear='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
#< Docker.

#> Container shells.
alias phpc='docker exec -it $(docker ps -aqf "name=php") sh'
alias nginxc='docker exec -it $(docker ps -aqf "name=nginx") sh'
alias dbc='docker exec -it $(docker ps -aqf "name=db") sh'
alias dbtc='docker exec -it $(docker ps -aqf "name=gulp-livereload") sh'
#< Container shells.


# Use a function for aliases that expand arguments from $@.
# Example: You want to run 'php bin/console cache:clean' inside the php container.
# Usage: console cache:clear

###> progonkpa/gulp-livereload ###
function npm() {
    args=$@
    docker exec -it $(docker ps -aqf "name=gulp-livereload") sh -c "npm $args"
}
function node() {
    args=$@
    docker exec -it $(docker ps -aqf "name=gulp-livereload") sh -c "node $args"
}
function gulp() {
    args=$@
    docker exec -it $(docker ps -aqf "name=gulp-livereload") sh -c "gulp $args"
}
###> progonkpa/gulp-livereload ###

###> Symfony ###
function console() {
    args=$@
    docker exec -it $(docker ps -aqf "name=php") sh -c "php bin/console $args"
}
function phpunit() {
    args=$@
    docker exec -it $(docker ps -aqf "name=php") sh -c "php bin/phpunit $args"
}
function composerd() {
    args=$@
    docker exec -it $(docker ps -aqf "name=php") sh -c "composer $args"
}
###> Symfony ###