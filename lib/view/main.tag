
require('./form.tag')

<main>
    <header>
        <nav>
            <ul>
                <li><a href="#test">Test</a></li>
                <li><a href="#form/user">Form</a></li>
                <li><a href="#user">User</a></li>
            </ul>
        </nav>
    </header>
    <article>
        <div id="mainview"></div>
    </article>
    <footer>
        <nav>
            <a onclick={btn}>Btn</a>
        </nav>
    </footer>

    <script>
        var self = this;

        self._currentView = null;

        self.btn = () => {
            console.log('data');
        }

        self.loadView = (viewName, id) => {
            console.log('loadView', viewName, id);
            if (this._currentView) {
                this._currentView.unmount(true);
            }
            var m = riot.mount('div#mainview', viewName, {data: id});
            console.log('loadView', m);
            this._currentView = m[0];
        }

        this.studyRoute = (view, id, param) => {
            console.log(view);
            console.log('route', view, id, param);
            switch (view) {
                case 'test':
                    this.loadView('test');
                    break;
                case 'form':
                    this.loadView('main-form', id);
                    break;
                case 'user':
                    this.loadView('user');
                    break;
                default:
                    this.loadView('test');
            }
        }

        riot.route(self.studyRoute);

        self.on('mount', function() {
            riot.route.start(true);
        });

    </script>
</main>
