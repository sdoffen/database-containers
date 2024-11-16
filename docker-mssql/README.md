# Docker: MSSQL Server

From this folder, run the command

```
docker compose up -d
```

To change the initial setup of the database, edit the [init.sql](./init-db/init.sql) file.

## Connecting using DBeaver

To connect to the MSSQL server using a client application like [DBeaver](https://dbeaver.io/), you will need to enter values from the `services.mssql.environment` section of the [`docker-compose`](./docker-compose.yml) file. If you didn't make any changes, then the default values below will work for you.

| Name                | Default Value     |
|---------------------|-------------------|
| SA_PASSWORD         | StrongPassword123 |

You will also need the `port` value, which defaults to `1433`. The default user is `sa` (for Server Administrator).

Enter the following values into the specified fields on the *Main* tab of the *Connection settings* modal dialog to create a new connection:

| Field Name  | Value                 |
|-------------|-----------------------|
| Server Host | localhost             |
| Database    | master                |
| Port        | *&lt;port&gt;*        |
| Username    | sa                    |
| Password    | *&lt;SA_PASSWORD&gt;* |

Click on the **Test Connection...** button to verify that the connection can be made successfully.
