# admin scripts

**Note**: Please replace '2019-07-07' with the name of the repository.

Prerequisites:

- `docker` CLI available in the system

when setting up a new machine for hackathons:

```sh
# run from the top of the source tree
scripts/create_hackathon_account
```

after that, the flow of the admin steps is:

## foreach hackathon:

1. create a local clone of the hackathon repo in `/home/hackathon`, e.g.:

```sh
cd /home/hackathon
git clone https://githib.com/pmemhackathon/2019-07-07
```

2. create users, e.g.:

```sh
# creates all 200 accounts
create_pmemusers 1 200 2019-07-07
```

3. create a directory for the workshop

```sh
cd /home/hackathon/workshops
mkdir workshop_name
```

## foreach session with same users (or on system boot)

start the webhackathon daemon as root

```sh
cd /home/hackathon
./webhackathon 2019-07-07 &
enable_pmemusers 1 100 todayspasswd
```

...hack...hack...hack

if system is rebooted, restart containers:

```sh
docker start $(docker ps -aq -f name=pmemuser)
```

users can be disabled selectively using docker stop.

## after everyone is done and won't come back:

1. kill the webhackathon daemon
2. stop and delete all docker containers

```sh
docker stop $(docker ps -aq -f name=pmemuser)
docker rm $(docker ps -aq -f name=pmemuser)
```

3. delete_pmemusers (removes all pmemuserX accounts)

**Note**: we assume ID:GID 5000:5000 for the hackathon account and the range 5001:5001 through 5200:5200 are available for the 200 user accounts created.  edit all the scripts and change $BASEID if that has to change for some reason.

## tips for developers

When making changes to:
- `/home/hackathon/templates/examples/*/*.tmpl` files you have to restart the `webhackathon` daemon
- `/home/hackathon/2019-07-07/*` files you have to:

```sh
# stop and delete all docker containers
docker stop $(docker ps -aq -f name=pmemuser)
docker rm $(docker ps -aq -f name=pmemuser)

# and recreate all users
./scripts/delete_pmemusers
create_pmemusers 1 200 2019-07-07
enable_pmemusers 1 100 todayspasswd
```
