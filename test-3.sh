#!/bin/sh
echo "Hello world"

url="https://github.com/cloudspikes-inc/test-semantic-release/releases/tag/v1.0.234"
DEVOPS_VERSION="test-v3"
GITHUB_ORG="cloudspikes-inc/test-semantic-release"
url="https://github.com/$GITHUB_ORG/releases/tag/$DEVOPS_VERSION"
TOKEN_VAL=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


echo url = $url

if [ $(curl -LI -H "Accept: application/vnd.github+json" -H "Authorization: Bearer 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" -H "X-GitHub-Api-Version: 2022-11-28" -o /dev/null -w '%{http_code}\n' -s https://api.github.com/repos/cloudspikes-inc/child-repo-trigger/git/trees/test-v3) == "200" ]; then echo 0; fi

if [ $(curl -LI -H "Accept: application/vnd.github+json" -H "Authorization: Bearer $TOKEN_VAL" -H "X-GitHub-Api-Version: 2022-11-28" -o /dev/null -w '%{http_code}\n' -s https://api.github.com/repos/cloudspikes-inc/child-repo-trigger/git/trees/$DEVOPS_VERSION) == "200" ]; then
  echo "DevOps Version tag exists."
else
  echo "$DEVOPS_VERSION is not a valid release or tag."
fi
