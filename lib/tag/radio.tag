var _ = require('lodash');

<uipack-radio>
    <div class="form-group radio">
        <h5 class="control-label">{title}</h5>
        <label class="checkbox-inline" each={items}>
            <input type="radio" name={name} id={id} value={value} checked={checked}>
            {label}
        </label>
        <span if={help} class="help-block" id={'hele-' + opts.key}>{help || ''}</span>
    </div>

    <script type="text/javascript">
        var key = opts.key;
        var schema = opts.schema.properties[key];
        var input = opts.input[key];
        // console.log('[uipack-radio]', key, input, schema);

        this.title = input.title || schema.title || key || '';
        this.help = input.help || '';
        this.items = _.map(schema.enum, function(data, i) {
            var label = input.label && input.label[data];

            return {
                name: key,
                id: key + '-' + data,
                value: data,
                label: label || data,
                checked: i === 0 ? 'checked' : ''
            };
        });
    </script>
</uipack-radio>