# Docker: PostgreSQL Server

From this folder, run the command

```
docker compose up -d
```

To change the initial setup of the database, edit the [init.sql](./init-db/init.sql) file.

## Connecting using DBeaver

To connect to the PostgreSQL server using a client application like [DBeaver](https://dbeaver.io/), you will need to enter values from the `services.postgree.environment` section of the [`docker-compose`](./docker-compose.yml) file. If you didn't make any changes, then the default values below will work for you.

| Name                | Default Value |
|---------------------|---------------|
| POSTGRES_DB         | my_database   |
| POSTGRES_USER       | postgres      |
| POSTGRES_PASSWORD   | userpassword  |

You will also need the `port` value, which defaults to `5432`.

Enter the following values into the specified fields on the *Main* tab of the *Connection settings* modal dialog to create a new connection:

| Field Name  | Value                       |
|-------------|-----------------------------|
| Server Host | localhost                   |
| Database    | *&lt;POSTGRES_DB&gt;*       |
| Port        | *&lt;port&gt;*              |
| Username    | *&lt;POSTGRES_USER&gt;*     |
| Password    | *&lt;POSTGRES_PASSWORD&gt;* |

Click on the **Test Connection...** button to verify that the connection can be made successfully.
