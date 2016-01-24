/**
 * Dynamic Form Tag
 */

var _ = require('lodash');

var form = require('./index');

// import custom tags
require('./input.tag');

<uipack-dynamicform>
    <form onsubmit={submit}>
        <uipack-input each={forms} content={this}></uipack-input>
        <button class="btn btn-default" type="reset">CANCEL</button>
        <button class="btn btn-primary" type="submit">SUBMIT</button>
    </form>
    <script>
        console.log('[uipack-dynamic_form]', opts.data);

        this.forms = form.createDynamicForm(opts.data.key);

        this.submit = (e) => {
            var data = {};
            _.forEach(this.forms, (form) => {
                if (_.isEmpty(form.name)) {
                    return;
                }
                data[form.name] = this[form.name].value || '';
            })
            console.log(data);
        }
    </script>
</uipack-dynamicform>
