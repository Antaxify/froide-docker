What I did:
- as the project (froide-docker) is quite dated, upgraded the docker-compose db and elasticsearch version
- upgraded the Dockerfile to use Python 11.x and add some dependencies

The project is now starting with `docker-compose up`

Afterwards, I can connect to the app container using `docker exec -it froide_app bash` and run the following:

```
# build the frontend
npm install
npm run build

# initialize datastore
python3 manage.py migrate --skip-checks
python3 manage.py createsuperuser
python3 manage.py search_index --create
python3 manage.py search_index --populate
```

Some issues I faced:
- default config `elasticsearch:9200` -> `https://elasticsearch:9200` (not hard to fix, but a bit odd that the defaults are wrong)
- add the following to elasticsearch image to disable the need for authentication: (not sure if this is my mistake or missing defaults)
```
"xpack.security.transport.ssl.enabled=false"
"xpack.security.http.ssl.enabled=false"
"xpack.security.enabled=false"
```
- `python3 manage.py loaddata publicbody.json` from the GettingStarted not working, as `publicbody.json` seems to be missing
- In general, there is no versioning, making it hard to run a 'stable' build.
- Frontend was broken on main by a commit being done some hours(?) before. Got fixed by a follow up commit. However, versioning would help a lot here. 

To be frank: Not critizising the project, they can do whatever they want imho. However, it was quite clunky to run things so far, and if it starts out that way, I don't think it will change.
As you told me you are not a coder / techie, I would probably look towards something more robust.