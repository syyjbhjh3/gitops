#!/bin/bash
MODULES=$TARGET
APP_LIST="backend frontend"

echo "Deploy target application: "$TARGET
echo "TAG: "$TAG


chmod +x manifests/$TARGET.yaml

helm template -n test $TARGET charts/$TARGET -f charts/$TARGET/values.yaml \
     --set image.tag=${TAG} > manifests/$TARGET.yaml


# git add/commit/push
git add .
git commit -m "updating manifest file completed."
git push origin main