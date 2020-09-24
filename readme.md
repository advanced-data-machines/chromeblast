# chromeblast

Chromeblast is an attempt to implement a batch provisioning system for the ChromeCast system much of this is predicated on the excellent work of rithvikvibhu located here 
https://rithvikvibhu.github.io/GHLocalApi/#section/Google-Home-Local-API as there appears to be no support documentation from Google as to how best to accomplish.

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
    ./chromeblast.sh <username> <paassword> <service_account_name>
    ```

### Submit json 

e.g.

```
curl http://10.80.4.35:8008/setup/eureka_info
curl http://10.80.4.35:8008/setup/supported_timezones
curl http://10.80.4.35:8008/setup/supported_locales
```

```
curl -H "cast-local-authorization-token: LOCAL_AUTH_TOKEN" --verbose --insecure https://10.80.4.35:8008/setup/bluetooth/status
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

* remove the docker image
    ```
    docker rmi <image_id>
    ``` 

* clean up docker images
    ```
    docker system prune -a
    ``` 

</details>
