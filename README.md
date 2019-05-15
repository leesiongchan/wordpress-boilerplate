# WordPress Boilerplate

Very simple boilerplate to get your WordPress up without crying!

## Get Started

1.  Prepare `.env` file.

    You may copy from the default template file (`.env.dist`) in the project root directory, then modify and fill in the rest.

2.  Prepare `docker-compose-override.yaml` file.

    You may copy from the default template file (`docker-compose.override.yaml.dist`) in the project root directory, then modify and fill in the rest.

3.  Create an external network.

    ```sh
    $ docker network create web
    ```

4.  Create a `acme.json` file.

    ```sh
    $ touch acme.json
    ```

5.  Prepare `traefik.toml` file.

    You may copy from the default template file (`traefik.toml.dist`) in the project root directory, then modify and fill in the rest.

6.  Start the project!

    ```sh
    $ docker-compose up -d
    ```

## FAQs

1.  I have permission issue!

    Run below command to fix it!

    ```sh
    $ docker-compose run --rm php bash /tmp/wp-permissions-fix.sh
    ```
