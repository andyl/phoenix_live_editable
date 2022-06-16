# Phoenix Live Editable - Release Procedures

For every push of the master branch:

- review issues and close finished items

- update README and Guides

    vim README.md 
    vim apps/phoenix_live_editable/Guides
    cp README.md apps/phoenix_live_editable

- increment versions (umbrella and package are to be the same)

    vim mix.exs
    vim apps/phoenix_live_editable/mix.exs 

- update PLE Changelog 

    vim apps/phoenix_live_editable/CHANGELOG.md 

- Dockerfile test build and run

    docker build . -t ple_test
    docker run -p 8080-8082:8080-8082 ple_test

- add a git tag 

    git tag                 # list tags 
    git tag v0.0.1          # create tag
    git push origin v0.0.1  # push tag

- push umbrella to GitHub 

    git push 

- browser check - `https://github.com/andyl/phoenix_live_editable`

- build a docker image 

    docker build . -t andyldk/phoenix_live_editable:v0.0.1

- browser check - `https://hub.docker.com/r/andyldk/phoenix_live_editable`

- push umbrella to DockerHub

    docker push andyldk/phoenix_live_editable 

- push umbrella to Fly.io 

    fly deploy

- browser check - `https://phoenix-live-editable.fly.dev`

- push `phoenix_live_editable` to Hex.pm

    cd apps/phoenix_live_editable
    mix hex.publish

- browser check - `https://hex.pm/packages/phoenix_live_editable`

