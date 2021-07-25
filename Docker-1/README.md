 # to build the image locally use below command 

 ```
 docker build -t litecoin .
 ```

 # to run container out of created image
 
 docker run -v ${PWD}/data:/home/litecoin/.litecoin -d litecoin