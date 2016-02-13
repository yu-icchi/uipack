<uipack-textarea>
    <div class="form-group">
        <label for="{opts.id}" class="col-sm-2 control-label">{opts.title}</label>
        <div class="col-sm-10">
            <textarea id="{opts.id}" class="form-control" cols="40" rows="{rows}" name="{opts.name}" placeholder="{opts.placeholder}" oninput={event}></textarea>
            <p if="{max}" class="text-right">{current}/{max}</p>
            <span if={opts.help} class="help-block" id={'hele-' + opts.id}>{opts.help || ''}</span>
        </div>
    </div>

    <script>
        this.current = 0;
        this.max = opts.maxLength;
        this.rows = 4;

        this.event = (e) => {
            var text = e.target.value;
            this.current = text.length;
            this.rows = Math.max(text.split('\n').length, 4);
        }

        this.on('uipackFormReset', function(e) {
            console.log('textarea reset');
        });
    </script>
</uipack-textarea>