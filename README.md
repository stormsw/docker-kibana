# Kibana 3 in docker origin from [bobrik/kibana](https://github.com/bobrik/docker-kibana4)

This is [kibana 3.1.2](https://github.com/elastic/kibana) based on alpine. Images are tagged by kibana versions.
It requires at least 0.90.9, recomended 1.4.0 Elasticsearch server version.
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
