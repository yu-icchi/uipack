
<uipack-select>
    <div class="form-group">
        <h5 class="control-label">{title}</h5>
        <select class="form-control">
            <option each={items} value={value}>{label}</option>
        </select>
        <span if={help} class="help-block" id={'hele-' + opts.key}>{help || ''}</span>
    </div>

    <script type="text/javascript">
        var key = opts.key;
        var schema = opts.schema.properties[key];
        var input = opts.input[key];
        // console.log('[uipack-select]', key, input, schema);

        this.title = input.title || schema.title || key || '';
        this.help = input.help || '';
        this.items = _.map(schema.enum, function(data) {
            var label = input.label && input.label[data];

            return {
                label: label,
                value: data
            };
        });
    </script>
</uipack-select>