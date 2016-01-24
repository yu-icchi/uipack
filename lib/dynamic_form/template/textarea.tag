<uipack-textarea>
    <div class="form-group">
        <label for="{opts.id}" class="col-sm-2 control-label">{opts.title}</label>
        <div class="col-sm-10">
            <textarea id="{opts.id}" class="form-control" cols="40" rows="4" name="{opts.name}" placeholder="{opts.placeholder}"></textarea>
            <span if={opts.help} class="help-block" id={'hele-' + opts.id}>{opts.help || ''}</span>
        </div>
    </div>
</uipack-textarea>