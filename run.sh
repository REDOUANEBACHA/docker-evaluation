docker network create mynetwork

docker run --network=mynetwork -e TASKS=4 -e PORT=3000 --name planner -d eval/planner
docker run --network=mynetwork --name worker0 -e PLANNER=http://planner:3000 -e PORT=8080 -e ADDRESS=http://worker0 -e MULT=true -e ADD=true -d eval/worker
docker run --network=mynetwork --name worker1 -e PLANNER=http://planner:3000 -e PORT=8081 -e ADDRESS=http://worker1 -e MULT=true -e ADD=true -d eval/worker
