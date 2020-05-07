Docker required.

```bash
$ ./build.sh
$ aws lambda publish-layer-version --layer-name mysqlclient-layer --description "mysqlclient layer" --license-info "MIT" \
--zip-file fileb://mysqlclient-lambda-layer.zip --compatible-runtimes python3.6 python3.7 python3.8
```
