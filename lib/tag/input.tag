var _ = require('lodash');
var $ = require('jquery');
var tv4 = require('tv4');

<uipack-input>
    <div class="form-group">
        <label if={label} class="control-label" for={opts.key}>{label}</label>
        <input class="form-control" id={opts.key} type={type} placeholder={placeholder} onblur={validate}>
        <span if={help} class="help-block" id={'hele-' + opts.key}>{help || ''}</span>
    </div>

    <script type="text/javascript">
        var key = opts.key;
        var schema = opts.schema.properties[key];
        var input = opts.input[key];

        this.type = input.type;
        if (!this.type) {
            this.type = (schema.type === 'integer' || schema.type === 'number') ? 'number' : 'text';
        }

        this.label = input.label || schema.title || key || '';
        this.help = input.help || '';
        this.placeholder = input.placeholder || '';

        var customValidate = _.isFunction(input.validate) ? input.validate : function() {return true;};
        this.validate = function(e) {
            var value = e.target.value;
            if (schema.type === 'integer' || schema.type === 'number') {
                value = Number(value);
            }
            var cvalid = customValidate(value);
            var svalid = tv4.validate(value, schema);
            if (cvalid && svalid) {
                $('#' + key).parent().removeClass('has-error');
            } else {
                $('#' + key).parent().addClass('has-error');
            }
        };
    </script>
</uipack-input>
