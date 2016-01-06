<!-- uipack-formspecs -->

var $ = require('jquery');
var riot = require('riot');
var form = require('../form');

<uipack-formspecs>
    <span>FromSpecs</span>
    <form id="formspecs" onsubmit={ submit }>

    </form>

    <script type="text/javascript">
        var schema = opts.schema;
        var html = form.create(opts.form);

        var inputMap = {};
        opts.form.inputs.forEach(function(input) {
            inputMap[input.key] = input;
        });

        this.submit = function() {
            console.log('submit');
        };
        this.on('update', function() {
            console.log('update');
            $('#formspecs').empty();
        });
        this.on('updated', function() {
            console.log('updated');
            $('#formspecs').html(html);
            riot.mount('uipack-input', {input: inputMap, schema: schema});
        });
    </script>
</uipack-formspecs>
