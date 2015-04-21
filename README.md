# Kibana 4 in docker origin from [bobrik/kibana](https://github.com/bobrik/docker-kibana4)

This is [kibana 4.1.0-snapshot-linux-x64](https://github.com/elastic/kibana) based on alpine. Images are tagged by kibana versions.
It requires at least 1.4.4 elasticsearch server version.
## Running

```
docker run -d -p <host ip>:<host port>:5601 \
    -e ELASTIC_URL=<elasticsearch url> stormsw/kibana
```
elasticsearch url should include protocol prefix, for ex.: http://localhost:9200

You could set `KIBANA_INDEX` env variable to set an index for kibana's data.

## No-highlight patch

Kibana has [unresolved issue](https://github.com/elastic/kibana/issues/2782)
that triggers an error if you use long text fields. This image has
patch applied that fixes the problem in tags with postfix `-no-highlighting`.

Once issue is resolved, patch will be removed from this image.
