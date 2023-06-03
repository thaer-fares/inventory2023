<!DOCTYPE html>
<html>

<head>
    <title>Export PDF</title>
    <style>
        table {
            border-collapse: collapse !important;
            border-color: #cecece !important;
        }

        th, td {
            padding: 10px !important;
        }

        thead, thead th {
            background-color: #5867dd;
            color: #fff;
        }
    </style>
</head>

<body>
<table border="1" width="100%">
    <thead>
    <tr>
{{--        @foreach ($headings as $th)--}}
{{--            <th scope="col">{{ $th }}</th>--}}
{{--        @endforeach--}}
        <th scope="col">Name</th>
        <th scope="col">Description</th>
        <th scope="col">Parent ID</th>
        <th scope="col">Status</th>
        <th scope="col">Status</th>
        <th scope="col">Status</th>
    </tr>
    </thead>

    <tbody>
    @foreach ($models as $model)
        <tr>
            <td>{{ $model->item->item_number }}</td>
            <td>{{ $model->item->name }}</td>
            <td>{{ $model->unit->name }}</td>
            <td>{{ $model->item->total_quantity }}</td>
            <td>_____</td>
            <td>_____</td>
        </tr>
    @endforeach
    </tbody>
</table>
</body>

</html>
