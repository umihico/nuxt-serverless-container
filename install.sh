cat <<EOF | docker run --rm -i --entrypoint '' -v $(pwd):/var/task amazon/aws-lambda-nodejs:14 bash -xv
mktemp -d
cd /tmp/tmp.*
npx create-nuxt-app --answers "{ \
  \"name\": \"nuxt-serverless-container-demo\", \
  \"language\": \"js\", \
  \"description\": \"nuxt-serverless-container-demo\", \
  \"author\": \"umihico\", \
  \"pm\": \"npm\", \
  \"ui\": \"none\", \
  \"server\": \"none\", \
  \"features\": \"axios\", \
  \"linter\": \"eslint\", \
  \"test\"  : \"none\", \
  \"mode\"  : \"universal\", \
  \"target\"  : \"server\", \
  \"devTools\": \"jsconfig.json\" }"
# You can configure these answers.
# Please check https://github.com/nuxt/create-nuxt-app/blob/a0da9468f0f95b4577e1dbbc7bb303396d99c1b8/packages/create-nuxt-app/lib/prompts.js
npm install esm serverless-http nuxt-start # installing extra dependencies
rm -rf node_modules # too heavy. stay in container.
rm README.md # avoid overwriting my README.md
cp -r * /var/task/
EOF
