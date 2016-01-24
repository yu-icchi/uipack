
<uipack-array>
    <div class="form-group">
        <h5>input array</h5>
        <fieldset>
            <legend>{title}</legend>
            <div id="array"></div>
            <button class="btn btn-default" onclick={click}>Add</button>
        </fieldset>
    </div>

    <script type="text/javascript">
        this.title = 'Array';
        this.click = function(e) {
            console.log('クリック');
            $('#array').append('<uipack-input key="_id"></uipack-input>');
        };
        this.on('updated', function() {
            riot.mount('uipack-input, uipack-textarea, uipack-radio, uipack-checkbox, uipack-select, uipack-error',{
            });
        });
    </script>
</uipack-array>