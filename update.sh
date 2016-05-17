# Version grabbing taken from install.sh script in Apex https://github.com/apex/apex
LATEST=$(curl -s https://api.github.com/repos/coreos/rkt/tags | grep -Eo '"name":.*?[^\\]",'  | head -n 1 | sed 's/[," ]//g' | cut -d ':' -f 2)
URL="https://github.com/coreos/rkt/releases/download/$LATEST/rkt-$LATEST.tar.gz"
if [ ! -d rkt-$LATEST ]; then
        echo Updating to rkt-$LATEST
        wget $URL && tar xzvf rkt-$(LATEST).tar.gz && rm rkt-$LATEST.tar.gz
else
        echo Already on latest version: $LATEST
fi

LATEST=$(curl -s https://api.github.com/repos/appc/acbuild/tags | grep -Eo '"name":.*?[^\\]",'  | head -n 1 | sed 's/[," ]//g' | cut -d ':' -f 2)
URL="https://github.com/appc/acbuild/releases/download/$LATEST/acbuild.tar.gz"

if [ $(cat acbuild.txt | grep $LATEST | wc -l | xargs) -lt 1 ]; then
        echo "Updating to acbuild $LATEST"
        wget $URL && tar xzvf acbuild && rm acbuild.tar.gz
        echo $LATEST > acbuild.txt
else
        echo "Already on latest acbuild version: $LATEST"
fi
