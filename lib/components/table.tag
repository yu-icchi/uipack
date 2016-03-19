/**
 * Table Tag
 */

var Handlebars = require('handlebars');

// import custom tag
require('./raw.tag');

<uipack-table>
    <table class="table">
        <thead>
            <tr>
                <td each={rows}>{title || key}</td>
            </tr>
        </thead>
        <tbody>
            <tr each={item, i in items}>
                <td each={rows}><raw content="{ show(item, key, template) }"></raw></td>
            </tr>
        </tbody>
    </table>

    <script>

        this.show = function(item, key, template) {
            var value = item && item[key] || '';
            if (template) {
                var compiled = Handlebars.compile(template);
                value = compiled(key ? value : item);
            }
            return value;
        };
        this.items = opts.items;
        this.rows = opts.rows;
    </script>
</uipack-table>
