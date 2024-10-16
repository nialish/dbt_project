# Dockerfile

FROM --platform=linux/amd64 python:3.10-slim-buster

RUN apt-get update \
    && apt-get install -y --no-install-recommends

COPY ./transformation /usr/app/dbt_project

WORKDIR /usr/app/dbt_project/transformation

# Ensure the .dbt directory exists
RUN mkdir -p /root/.dbt

# Copy the profiles.yml file into the container
COPY ./transformation/profiles.yml /root/.dbt/profiles.yml

# Install the dbt Postgres adapter. This step will also install dbt-core
RUN pip install --upgrade pip
RUN pip install dbt-duckdb==1.6.2
RUN pip install pytz



# Install dbt dependencies (as specified in packages.yml file)
# Build seeds, models and snapshots (and run tests wherever applicable)
CMD ["sleep", "infinity"]