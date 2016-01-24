
var form = require('./index');

<uipack-array>
    <span>{title}</span>
    <div class="form-group">
        <div class="form-group" each={items}>
            <div class="form-group">
                <uipack-input each={forms} content={this}></uipack-input>
            </div>
            <button class="btn btn-default" disabled={disabled: disabled()} onclick={parent.up}>Up</button>
            <button class="btn btn-default" disabled={disabled: disabled()} onclick={parent.down}>Down</button>
            <button class="btn btn-default" onclick={parent.remove}>Remove</button>
        </div>
        <button class="btn btn-default" onclick={add}>Add #{items.length + 1}</button>
    </div>

    <script>
        this.items = [];

        this.disabled = () => {
            return this.items.length === 1;
        };

        this.add = (e) => {
            var forms = form.createForm();
            this.items.push({forms: forms});
        };

        this.up = (e) => {
            var item = e.item;
            var idx = this.items.indexOf(item);
            if (idx === 0) {
                return;
            }
            var tmp = this.items[idx];
            this.items[idx] = this.items[idx-1];
            this.items[idx-1] = tmp;
        };

        this.down = (e) => {
            var item = e.item;
            var idx = this.items.indexOf(item);
            if (idx === (this.items.length - 1)) {
                return;
            }
            var tmp = this.items[idx];
            this.items[idx] = this.items[idx+1];
            this.items[idx+1] = tmp;
        };

        this.remove = (e) => {
            var item = e.item;
            var idx = this.items.indexOf(item);
            this.items.splice(idx, 1);
        };
    </script>
</uipack-array>
