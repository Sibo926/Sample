This is one of the script that I have worked on.

we used to get many requests to delete a particular dependency in pom.xml of all the projects.( projects number =~ 150 ), to do this manually it takes lot effort and if we get similar task again the whole step has to be repeated. to aviod that manual intervension I had return a shell script.

Before writing this we had to consider few things. Each and every dependency were having diff number of lines, for example surefire-junit4 can be only 5 lines 

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

The script ``` dependency_delete.sh ``` helps use to delete a particular dependency in all the projects, and we can manaully checkin the code repo but if you want we can include git add, commit and push commands too (   to make it lil simple i have added only deleting dependency part only)

# to run the script use the below commad

```
sh dependency_delete.sh "path_where_therepos_present/*" "<artifactId>maven-jdeprscan-plugin</artifactId>"
```

first parameter - folder wherein all the projects has been cloned or present ( I had taken few projects from internet and added in this folder which might help you to test) and also at the end * which is very important 

second parameter - artifact name which you want to delete,  <artifactId> and </artifactId> are important too.