

[Elasticsearch](http://www.elasticsearch.org/) is a powerful open source search and analytics engine, and it's easy to add to your application as an add-in.

## Add Elasticearch
To add Elasticsearch to your application, access the add-ins menu, click _Elasticsearch_ and choose the size of your new server. This adds three environment variables to your application: `ELASTICSEARCH_ADDRESS_INT`, `ELASTICSEARCH_ADDRESS_EXT` and `ELASTICSEARCH_ADDRESS`, which you can use to connect to your Elasticsearch instance.
{% if page.collection == 'legacy_docker' or page.collection == 'maestro' %}

#### Note
<div class="notice notice-danger">
	<p>For docker applications this will be added to the host not as a container.</p>
</div>
{% endif %}