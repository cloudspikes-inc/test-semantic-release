#!/bin/sh

echo "Hello world"

url="https://github.com/cloudspikes-inc/test-semantic-release/releases/tag/v1.0.234"
DEVOPS_VERSION="v1.0.3"
GITHUB_ORG="cloudspikes-inc/test-semantic-release"
url="https://github.com/$GITHUB_ORG/releases/tag/$DEVOPS_VERSION"

echo url = $url

if curl --output /dev/null --silent --head --fail $url; then
  echo "DevOps Version tag exists."
else
  echo "$DEVOPS_VERSION is not a valid release or tag."
fi
