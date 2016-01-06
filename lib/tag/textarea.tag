var _ = require('lodash');
var $ = require('jquery');
var tv4 = require('tv4');

<uipack-textarea>
    <div class="form-group">
        <label if={title} class="control-label" for={opts.key}>{title}</label>
        <textarea class="form-control" id={opts.key} placeholder={placeholder} rows="3" onkeyup={validate}></textarea>
        <span if={help} class="help-block" id={'hele-' + opts.key}>{help || ''}</span>
    </div>

    <script type="text/javascript">
        var key = opts.key;
        var schema = opts.schema.properties[key];
        var input = opts.input[key];
        console.log('[uipack-textarea]', key, input, schema);

        this.title = input.title || schema.title || key || '';
        this.help = input.help || '';
        this.placeholder = input.placeholder || '';

        var customValidate = _.isFunction(input.validate) ? input.validate : function() {return true;};
        this.validate = function(e) {
            var value = e.target.value;
            var cvalid = customValidate(value);
            var svalid = tv4.validate(value, schema);
            if (cvalid && svalid) {
                $('#' + key).parent().removeClass('has-error');
            } else {
                $('#' + key).parent().addClass('has-error');
            }
        };
    </script>
</uipack-textarea>