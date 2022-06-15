# Phoenix Live Editable - Release Procedures

For every push of the master branch:

- review issues and close finished items

- update README and Guides

    vim README.md 
    vim apps/phoenix_live_editable/Guides
    cp README.md apps/phoenix_live_editable

- increment versions (both are to be the same)

    vim mix.exs
    vim apps/phoenix_live_editable/mix.exs 

- update PLE Changelog 

    vim apps/phoenix_live_editable/CHANGELOG.md 

- add a git tag 

    git tag                 # list tags 
    git tag v0.0.1          # create tag
    git push origin v0.0.1  # push tag

- push umbrella to GitHub 

    git push 

- push `phoenix_live_editable` to Hex.pm

    mix hex.publish

- build a docker image 

    docker build . -t andyldk/phoenix_live_editable:v0.0.1

- push umbrella to Fly.io 

    fly deploy

- push umbrella to DockerHub

    docker push andyldk/phoenix_live_editable 

