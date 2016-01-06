<!-- uipack-formspecs -->

var $ = require('jquery');
var riot = require('riot');
var form = require('../form');

<uipack-formspecs>
    <span>{title}</span>
    <form id="formspecs" onsubmit={submit}></form>

    <script type="text/javascript">
        var schema = opts.schema;
        var html = form.create(opts.form, schema);

        this.title = opts.form.title || '';

        var inputMap = {};
        opts.form.inputs.forEach(function(input) {
            inputMap[input.key] = input;
        });

        this.submit = function() {
            console.log('[uipack-formspecs]', 'submit');
        };
        this.on('update', function() {
            console.log('[uipack-formspecs]', 'update');
            $('#formspecs').empty();
        });
        this.on('updated', function() {
            console.log('[uipack-formspecs]', 'updated');
            $('#formspecs').html(html);
            riot.mount(
                'uipack-input, uipack-textarea, uipack-radio, uipack-checkbox, uipack-select, uipack-error',{
                input: inputMap,
                schema: schema
            });
        });
    </script>
</uipack-formspecs>
