This is one of the scripts I have worked on.

I used to get many requests to delete a particular dependency in pom.xml of lots of projects. To do this manually, it takes a lot of effort and if we get similar task again the whole step has to be repeated. to aviod that manual intervension I had to write a shell script.

Before proceeding with the script, some stuffs had to be taken into consideration. Each and every dependency were having different number of lines, for example surefire-junit4 can only be 5 lines.  .

```
		<dependency>
				<groupId>org.apache.maven.surefire</groupId>
				<artifactId>surefire-junit4</artifactId>
				<version>2.19.1</version>
		</dependency>

```

and other dependency can be lesser or more lines like below 

```
        <dependency>
				<groupId>junit</groupId>
				<artifactId>junit</artifactId>
				<version>4.1</version>
				<scope>test</scope>
		</dependency>

```

so it was very important to identify the start number and end number line to delete the dependency.

The script ``` dependency_delete.sh ``` helped me delete a particular dependency in all of the projects. 

# to run the script use the below command 

```
sh dependency_delete.sh "path_where_therepos_present/*" "<artifactId>maven-jdeprscan-plugin</artifactId>"
```

first parameter - folder wherein all the projects have been cloned or present 
second parameter - dependency artifactId which you want to delete,  <artifactId> and </artifactId>
