<uipack-string>
    <div class="form-group">
        <label for="{opts.id}" class="col-sm-2 control-label" >{opts.title}</label>
        <div class="col-sm-10">
            <input id="{opts.id}" class="form-control" type="text" name="{opts.name}" placeholder="{opts.placeholder}" />
            <span if={opts.help} class="help-block" id={'hele-' + opts.id}>{opts.help || ''}</span>
        </div>
    </div>
</uipack-string>
