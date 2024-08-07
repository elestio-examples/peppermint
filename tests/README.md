<a href="https://elest.io">
  <img src="https://elest.io/images/elestio.svg" alt="elest.io" width="150" height="75">
</a>

[![Discord](https://img.shields.io/static/v1.svg?logo=discord&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=Discord&message=community)](https://discord.gg/4T4JGaMYrD "Get instant assistance and engage in live discussions with both the community and team through our chat feature.")
[![Elestio examples](https://img.shields.io/static/v1.svg?logo=github&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=github&message=open%20source)](https://github.com/elestio-examples "Access the source code for all our repositories by viewing them.")
[![Blog](https://img.shields.io/static/v1.svg?color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Blog)](https://blog.elest.io "Latest news about elestio, open source software, and DevOps techniques.")

# Peppermint, verified and packaged by Elestio

[Peppermint](https://peppermint.sh/) An open source ticket management & help desk solution. A zendesk/freshdesk alternative.

<img src="https://github.com/elestio-examples/peppermint/raw/main/peppermint.jpeg" alt="peppermint" width="800">

Deploy a <a target="_blank" href="https://elest.io/open-source/peppermint">fully managed Peppermint</a> on <a target="_blank" href="https://elest.io/">elest.io</a> if you want automated backups, reverse proxy with SSL termination, firewall, automated OS & Software updates, and a team of Linux experts and open source enthusiasts to ensure your services are always safe, and functional.

[![deploy](https://github.com/elestio-examples/peppermint/raw/main/deploy-on-elestio.png)](https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/peppermint)

# Why use Elestio images?

- Elestio stays in sync with updates from the original source and quickly releases new versions of this image through our automated processes.
- Elestio images provide timely access to the most recent bug fixes and features.
- Our team performs quality control checks to ensure the products we release meet our high standards.

# Usage

## Git clone

You can deploy it easily with the following command:

    git clone https://github.com/elestio-examples/peppermint.git

Copy the .env file from tests folder to the project directory

    cp ./tests/.env ./.env

Edit the .env file with your own values.

Run the project with the following command

    docker-compose up -d

You can access the Web UI at: `http://your-domain:32769`

## Docker-compose

Here are some example snippets to help you get started creating a container.

    version: "3.7"

    services:
        peppermint:
          image: elestio4test/peppermint:latest
          ports:
            - 172.17.0.1:32769:3000
            - 1001:5003
          restart: always
          depends_on:
            - postgres
          environment:
            DB_USERNAME: ${DB_USERNAME}
            DB_PASSWORD: ${DB_PASSWORD}
            DB_HOST: ${DB_HOST}
            SECRET: ${ADMIN_PASSWORD}

        postgres:
          image: elestio/postgres:15
          restart: always
          volumes:
            - ./postgres-data:/var/lib/postgresql/data
          environment:
            - POSTGRES_DB=${DB_DATABASE}
            - POSTGRES_USER=${DB_USERNAME}
            - POSTGRES_PASSWORD=${DB_PASSWORD}
          ports:
            - "172.17.0.1:39530:5432"

### Environment variables

|       Variable       | Value (example)  |
| :------------------: | :--------------: |
| SOFTWARE_VERSION_TAG |      latest      |
|        DOMAIN        |   your-domain    |
|     ADMIN_EMAIL      | admin@email.com  |
|    ADMIN_PASSWORD    |  your-password   |
|       DB_HOST        |     postgres     |
|       DB_PORT        |       5432       |
|     DB_DATABASE      |    peppermint    |
|     DB_USERNAME      |     postgres     |
|     DB_PASSWORD      |  your-password   |
|      MAIL_HOST       |    smtp-host     |
|      MAIL_PORT       |    smtp-port     |
|  MAIL_FROM_ADDRESS   | sender@email.com |

# Maintenance

## Logging

The Elestio Peppermint Docker image sends the container logs to stdout. To view the logs, you can use the following command:

    docker-compose logs -f

To stop the stack you can use the following command:

    docker-compose down

## Backup and Restore with Docker Compose

To make backup and restore operations easier, we are using folder volume mounts. You can simply stop your stack with docker-compose down, then backup all the files and subfolders in the folder near the docker-compose.yml file.

Creating a ZIP Archive
For example, if you want to create a ZIP archive, navigate to the folder where you have your docker-compose.yml file and use this command:

    zip -r myarchive.zip .

Restoring from ZIP Archive
To restore from a ZIP archive, unzip the archive into the original folder using the following command:

    unzip myarchive.zip -d /path/to/original/folder

Starting Your Stack
Once your backup is complete, you can start your stack again with the following command:

    docker-compose up -d

That's it! With these simple steps, you can easily backup and restore your data volumes using Docker Compose.

# Links

- <a target="_blank" href="https://docs.peppermint.sh/">Peppermint documentation</a>

- <a target="_blank" href="https://github.com/Peppermint-Lab/peppermint">Peppermint Github repository</a>

- <a target="_blank" href="https://github.com/elestio-examples/peppermint">Elestio/Peppermint Github repository</a>
