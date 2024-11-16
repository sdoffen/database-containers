# Docker: MySQL Server

From this folder, run the command

```
docker compose up -d
```

To change the initial setup of the database, edit the [init.sql](./init-db/init.sql) file.

## Connecting using DBeaver

To connect to the MySQL server using a client application like [DBeaver](https://dbeaver.io/), you will need to enter values from the `services.mysql.environment` section of the [`docker-compose`](./docker-compose.yml) file. If you didn't make any changes, then the default values below will work for you.

| Name                | Default Value     |
|---------------------|-------------------|
| MYSQL_DATABASE      | my_database       |
| MYSQL_USER          | user              |
| MYSQL_PASSWORD      | StrongPassword123 |

You will also need the `port` value, which defaults to `3306`.

Enter the following values into the specified fields on the *Main* tab of the *Connection settings* modal dialog to create a new connection:

| Field Name  | Value                    |
|-------------|--------------------------|
| Server Host | localhost                |
| Database    | *&lt;MYSQL_DATABASE&gt;* |
| Port        | *&lt;port&gt;*           |
| Username    | *&lt;MYSQL_USER&gt;*     |
| Password    | *&lt;MYSQL_PASSWORD&gt;* |

Click on the **Test Connection...** button to verify that the connection can be made successfully.

> [!TIP]
> If you receive the error `Public Key Retrieval is not allowed` when attempting to connect, go to the *Driver properties* tab of the *Connection settings* modal dialog, and set the key `allowPublicKeyRetrieval` under *Driver properties* to `true`, then test the connection again.