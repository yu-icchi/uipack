
<uipack-checkbox>
    <div class="form-group checkbox">
        <h5 class="control-label">{title}</h5>
        <label class="checkbox-inline" each={items}>
            <input type="checkbox" id="{id}" value="{value}">
            {label}
        </label>
        <span if={help} class="help-block" id={'hele-' + opts.key}>{help || ''}</span>
    </div>

    <script type="text/javascript">
        var key = opts.key;
        var schema = opts.schema.properties[key];
        var input = opts.input[key];
        console.log('[uipack-checkbox]', key, input, schema);

        this.title = input.title || schema.title || key || '';
        this.help = input.help || '';
        this.items = _.map(schema.enum, function(data, i) {
            var label = input.label && input.label[data];

            return {
                id: key + '-' + data,
                value: data,
                label: label || data
            };
        });
    </script>
</uipack-checkbox>