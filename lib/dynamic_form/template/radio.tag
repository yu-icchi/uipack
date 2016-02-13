<uipack-radio>
    <div class="form-group radio">
        <h5 class="col-sm-2 control-label">{opts.title}</h5>
        <div class="col-sm-10">
            <label class="radio-inline" each={opts.items}>
                <input type="radio" name="{name}" id="{id}" value="{value}" onchange="{changed}">
                {label}
            </label>
            <span if={opts.help} class="help-block" id={'hele-' + opts.id}>{opts.help || ''}</span>
        </div>
    </div>

    <script>
        this.changed = e => {
            console.log('チェンジ', e.target.value);
        }
    </script>
</uipack-radio>