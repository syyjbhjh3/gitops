#!/bin/bash
MODULES=$TARGET
APP_LIST="backend frontend"

echo "Deploy target application: "$TARGET
echo "TAG: "$TAG

helm template -n test $TARGET charts/$TARGET -f charts/$TARGET/values.yaml \
     --set image.tag=${TAG} > manifests/$TARGET.yaml

git config --global --add safe.directory /var/lib/jenkins/workspace/gitops-manifest-update
# git add/commit/push
git add .
git commit -m "updating manifest file completed."
git push origin HEAD:main