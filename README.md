# rkt-utils
Utilities to make building ACIs and deploying with rkt easy

## Update rkt and acbuild

Downloads or updates rkt and acbuild via a simple script. 
Stores acbuild version tag taken from GitHub in a txt file.
Uploads rkt/acbuild to your dev/prod servers so you don't have to.

Uncomment and configure SSH hostnames in `update.sh` for where to push updated rkt and acbuild.

```
./update.sh
```
