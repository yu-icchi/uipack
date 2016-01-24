<uipack-checkbox>
    <div class="form-group checkbox">
        <h5 class="control-label">{opts.title}</h5>
        <label class="checkbox-inline" each={opts.items}>
            <input type="checkbox" id="{id}" value="{value}">
            {label}
        </label>
        <span if={opts. help} class="help-block" id={'hele-' + opts.key}>{help || ''}</span>
    </div>
</uipack-checkbox>