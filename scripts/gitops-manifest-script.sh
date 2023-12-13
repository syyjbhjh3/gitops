#!/bin/bash
MODULES=($TARGETS)
APP_LIST="backend frontend"
for TARGET in "${MODULES[@]}"
do
    echo "Deploy target application: "$TARGET
    echo "TAG: "$TAG

    helm template -n test $TARGET ./charts/$TARGET -f ./charts/$TARGET/$TARGET.yaml \
    --set image.tag=${TAG} > ./manifests/cmp-portal/$ENV/$TARGET.yaml
done

# git add/commit/push
git add .
git commit -m "updating manifest file completed."
git push origin HEAD:main