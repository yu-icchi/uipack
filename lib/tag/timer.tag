<timer>

    <p>Seconds Elapsed: { time }</p>

    <script type="text/javascript">
        var self = this;

        this.time = opts.start || 0;

        this.tick = function() {
            self.update({ time: ++self.time })
        };

        var timer = setInterval(this.tick, 1000);

        this.on('unmount', function() {
            clearInterval(timer)
        });
    </script>
</timer>