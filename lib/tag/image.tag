<!-- uipack-image -->

var _ = require('lodash');

<uipack-image>
    <img src={ path } >

    <script>
        this.path = 'img/';
        this.path += (opts.id || '').replace('-', '/');
        this.path += '.png';
        // console.log('lodash', _.isString(0));
        // console.log('uipack-image', opts.id, this.path);
    </script>
</uipack-image>
