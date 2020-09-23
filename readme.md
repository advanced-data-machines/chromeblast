# chromeblast


## Setting up chromeblast application stack
1. First docker must be [installed](https://docs.docker.com/engine/install/ubuntu)

        
    ```
    curl -fsSL https://get.docker.com -o get-docker.sh
    ```    
    ```
    sudo sh get-docker.sh
    ```
    ```
    sudo usermod -aG docker $USER
    ```
 
    test your docker install using:
        
    ```    
    docker run hello-world
    ```

3. Clone the git repository and cd to the chromeblast dir
    ```
    git clone https://github.com/sjbeskur/chromeblast.git
    ```

4. Build and run the container
    ```
    docker build -t chromeblast .
    ```

    ```    
    docker-compose up -d
    ```

This will launch the containers on localhost.  The UI will be available at http://localhost:8080 and the api will be available at http://localhost:8880


### Submit text to the telepropter vi RESTFul json 

e.g.

```
curl -d '{ "Text" : "hello how are you today" }' -H 'Content-Type: application/json' -X POST http://localhost:5000/api/v1/display/create -i
```




<details>
    <summary>Click here for some helpful docker commands:</summary>
 
* show running containers
    ```
    docker ps 
    ``` 

* stop a containers
    ```
    docker stop <container_id>
    ``` 

* shut down the stack
    ```
    docker-compose down
    ``` 

* clean up docker images
    ```
    docker system prune -a
    ``` 

</details>
