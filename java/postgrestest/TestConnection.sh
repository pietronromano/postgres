# SEE https://www.tigerdata.com/blog/how-to-test-your-postgresql-connection

# NOTE VS Code: Need to open this folder in VS Code, not parent folders, otherwise shows package errors

# Step 1: Download Postres drivers

# Step 2: Download the PostgreSQL JDBC driver 
# https://jdbc.postgresql.org/

# Step 3: Write Java code 
# Create a new file named PostgresConnectionTest.java and paste this Java code into the file 

# Step 4: Compile the Java code 
postgres_drivers="/Users/macbookpro/dev/databases/postgresql/java/drivers/postgresql-42.7.8.jar"

# -cp for current directory ".", ":" to chain others, then drivers
javac -cp .:$postgres_drivers PostgresConnectionTest.java

# Step 5: Test connection: 
java -cp .:$postgres_drivers PostgresConnectionTest

    # --> Connected to the PostgreSQL server successfully!
