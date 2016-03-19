<test>
    <script>
        var rows = [
            {
                title: 'MIXIN',
                template: '<li>{{_id}}</li><li>{{text}}</li>'
            },
            {
                title: 'ID',
                key: '_id'
            },
            {
                title: 'TEXT',
                key: 'text'
            },
            {
                title: 'AGE',
                key: 'age'
            },
            {
                title: 'IMAGE',
                key: 'image',
                template: '<img src="{{this}}" width="128" height="128">'
            }
        ];
        var items = [
            {
                _id: 'test',
                text: 'てすと',
                age: 12,
                image: 'http://www.menucool.com/slider/jsImgSlider/images/image-slider-2.jpg'
            },
            {
                _id: 'hoge',
                text: 'ほげ',
                age: 13,
                image: 'https://cdn.photographylife.com/wp-content/uploads/2014/06/Nikon-D810-Image-Sample-6.jpg'
            },
            {
                _id: 'oracle',
                text: 'オラクル',
                age: 14,
                image: 'http://www.online-image-editor.com//styles/2014/images/example_image.png'
            }
        ];
        riot.mount(this.root, 'uipack-table', {rows: rows, items: items})
    </script>
</test>
