#!/bin/sh
echo "Hello world"

url="https://github.com/cloudspikes-inc/test-semantic-release/releases/tag/v1.0.234"
DEVOPS_VERSION="v1.0.3"
GITHUB_ORG="cloudspikes-inc/test-semantic-release"
url="https://github.com/$GITHUB_ORG/releases/tag/$DEVOPS_VERSION"

echo url = $url

if curl -H 'Authorization: token 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' -H 'Accept: application/vnd.github.v3.raw' --output /dev/null --silent --head --fail https://api.github.com/repos/cloudspikes-inc/child-repo-trigger/releases/tag/test-v3; then
  echo "DevOps Version tag exists."
else
  echo "$DEVOPS_VERSION is not a valid release or tag."
fi
