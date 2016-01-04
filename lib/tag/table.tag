<!-- uipack-table -->

<uipack-table>
    <table>
        <caption>{ title }</caption>
        <thead>
            <tr>
                <th each={ rows }>{ title }</th>
            </tr>
        </thead>
        <tbody>
            <tr each={ data }>
                <td>{_id}</td>
                <td>{name}</td>
                <td>{gender}</td>
            </tr>
        </tbody>
    </table>

    <script>
        this.title = opts.title;
        this.rows = opts.rows;
        this.data = opts.data;
        console.log('[uipack-table]', this.title, this.rows, this.data);
    </script>
</uipack-table>