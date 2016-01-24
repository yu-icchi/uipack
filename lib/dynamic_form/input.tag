
var _ = require('lodash');

// import custom tag
require('./template/string.tag');
require('./template/number.tag');
require('./template/checkbox.tag');
require('./template/radio.tag');
require('./template/select.tag');
require('./template/textarea.tag');
require('./template/file.tag');
require('./array.tag');

<uipack-input>
    <script>
        if (_.isEmpty(opts.content.tag)) {
            throw new Error('dynamic form tag is not found. tag: ' + opts.content.tag);
        }
        riot.mount(this.root, opts.content.tag, opts.content);
    </script>
</uipack-input>
