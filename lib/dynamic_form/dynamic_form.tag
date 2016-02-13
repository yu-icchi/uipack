/**
 * Dynamic Form Tag
 */

var _ = require('lodash');

var form = require('./index');

// import custom tags
require('./input.tag');

<uipack-dynamicform>
    <form onsubmit={submit} onreset={reset}>
        <uipack-input each={forms} content={this}></uipack-input>
        <button class="btn btn-default" type="reset">CANCEL</button>
        <button class="btn btn-primary" type="submit">SUBMIT</button>
    </form>
    <script>

        var self = this;
        this.forms = form.createDynamicForm(opts.data.key);

        this.submit = function(e) {
            _.forEach(self.forms, function(form) {
               console.log(form.id, self[form.id].value);
            });
        };
    </script>
</uipack-dynamicform>
