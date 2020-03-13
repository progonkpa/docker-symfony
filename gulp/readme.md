# Node, Gulp, Livereload

The goal of this project is to alleviate the front-end setup by providing a reusable container with Node, Gulp & LiveReload installed with LiveReload running on container startup.    
By default, Gulp is watching changes to *.html files in ./src, so if you edit ./src/index.html, you're browser should refresh (don't forget to activate your browser plugin).  
When you use .bashrc as provided in this repo, you can run gulp, npm, node and other commands inside the buildtools container from your host terminal.  

## Getting started
* Change the environment values in .env as needed.  
    * SRC_DIR_HOST should point to the directory that contains your source files, including gulpfile.js.  
    * SRC_DIR_HOST can be left unchanged. 
* Run `docker-compose up --build -d`.
* Add an alias in your .bashrc that executes the gulp command inside the container.  
(Technically it's not an alias but a function. Have a look in .bashrc (in this repo) for more inspiration).  
    ```
    # ~/.bashrc
  
    function gulp() {
        args=$@
        docker exec -it $(docker ps -aqf "name=buildtools") sh -c "gulp $args"
    }
    ```
* Close and reopen your host terminal or run `source ~/.bashrc`
* Run `gulp` from your host terminal.

Note: With the alias installed, your gulp commands will be forwarded to the buildtools container.  
So if you're workflow mixed local gulp commands with container gulp commands, you should change the alias name e.g. gulpc (Gulp container).

## Troubleshooting
Issue: You run `gulp` in the terminal and get error:
> Local modules not found in /var/www/src

Solution:  
`npm install` is still running in the container (first run only). 
Wait a few minutes until it's finished: you'll see node_modules appear in $SRC_DIR_HOST when Node is done installing.

## Extra info regarding entrypoint/CMD-script: setup-node.sh

The container will run through setup-node.sh each time the container starts.  
It will only execute all steps during the first run, future container instances will have the dependencies available in the mapped volume.

Script actions:

1. Run 'npm install' if a package.json file is present but no node_modules directory.
2. Install Gulp with CLI if not yet exists.
3. Install Gulp Livereload if not yet exists.
4. Prevents the container from closing.  
