# rkt-utils
Utilities to make building ACIs and deploying with rkt easy

## Update rkt and acbuild

Downloads or updates rkt and acbuild via a simple script. 
Stores acbuild version tag taken from GitHub in a txt file.
Uploads rkt/acbuild to your dev/staging servers so you don't have to.

Uncomment and configure SSH hostnames in `update.sh` if you want to push updated rkt and acbuild, if not, you can run as-is and it will save them in your current directory.

```
# If you're just updating
curl https://raw.githubusercontent.com/farazfazli/rkt-utils/master/update.sh | sh
```

```
# If you're updating + pushing
curl https://raw.githubusercontent.com/farazfazli/rkt-utils/master/update.sh --output update.sh
```
## Delete all pods

Testing pods frequently and need to clean up your rkt list? Delete all pods with a single command if you don't feel like changing your ```rkt gc``` grace period.
```
sudo rkt rm $(rkt list --no-legend=true | cut -c-5)
```
