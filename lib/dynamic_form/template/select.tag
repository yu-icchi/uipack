<uipack-select>
    <div class="form-group">
        <label class="col-sm-2 control-label">{opts.title}</label>
        <div class="col-sm-10">
            <select id="{opts.id}" class="form-control">
                <option each={opts.items} value="{value}">{label}</option>
            </select>
            <span if={opts.help} class="help-block" id={'hele-' + opts.id}>{opts.help || ''}</span>
        </div>
    </div>
</uipack-select>